class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    def show 
    end

    def create
        @user = User.new(user_params)
    
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: "Rating was successfully created." }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: "Rating was successfully updated." }
            format.json { render :show, status: :ok, location: @user}
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end


    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :about_me)
      end
end
