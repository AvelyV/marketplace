class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_category, only: %i[new edit]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show; end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit; end

  # POST /listings or /listings.json
  def create
    # create listing
    @listing = Listing.new(listing_params)
    # create location
    location = Location.new(location_params)
    loc_exist = Location.find_by(location_params)
    
    # if location exists
    if loc_exist
      # point to excisting record
      @listing.location_id = loc_exist.id
    # if location does not exist, create
    else
      Location.create!(location_params)
    end

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
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
    @listing = current_user.listings.find_by(id: params[:id])
    redirect_to listings_path, notice: "Not authorised to alter this listing" if @listing.nil?
  end

  def set_category
    @categories = Category.all
  end
end
