class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update]
  before_action :set_category, only: %i[new edit]

  # GET /listings or /listings.json
  def index
    @listings = Listing.select(%i[title description id user_id location_id price qty]).includes(:location, :categories,
                                                                                                :picture_attachment).all
  end

  # GET /listings/1 or /listings/1.json
  def show; end

  # GET /listings/new
  def new
    @listing = Listing.new
    @location = Location.new
  end

  # GET /listings/1/edit
  def edit
    @location = @listing.location
  end

  # POST /listings or /listings.json
  def create
    # create listing
    @listing = Listing.new(listing_params)
    # see, if the location user entered already excists in the db
    @location = Location.find_by(location_params)

    #  location exists
    if @location
      # point to excisting record
      @listing.location = @location
    else
      @listing.location = Location.new(location_params)
      @location = @listing.location
    end

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    case params[:type]
    when "category"
      @listings = []
      # Look for a record in categories table, name column that contains string entered by the user
      cats = Category.where("name ILIKE ?", "%#{params[:query].strip}%")
      cats.each do |cat|
        cat.listings.each do |listing|
          @listings << listing
        end
      end
    when "postcode"
      @listings = []
      int_post = params[:query].to_i
      p params[:type]
      p int_post
      # Look in the locations table where column postcode value matches postcode entered by the user
      locs = Location.where("postcode = ?", int_post)
      p locs
      locs.each do |loc|
        loc.listings.each do |listing|
          @listings << listing
        end
      end
    when "title"
      # look in the listings table to find records in title column that contain user entered string
      @listings = Listing.where("title ILIKE ?", "%#{params[:query].strip}%")
    end

    render "index"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    # looking in the listings table to find a listing with matching id
    @listing = Listing.find(params[:id])
  rescue StandardError
    redirect_to listings_path
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:user_id, :location_id, :title, :description, :price, :qty, :picture,
                                    category_ids: [])
  end

  # location params
  def location_params
    params.require(:location).permit(:state, :postcode, :suburb)
  end

  def correct_user
    # looking in the listings table, to see if current user has a listing that matches @listing id
    @listing = current_user.listings.find_by(id: params[:id])
    (redirect_to listings_path, notice: "Not authorised to alter this listing") if @listing.nil?
  end

  def set_category
    @categories = Category.all
  end
end
