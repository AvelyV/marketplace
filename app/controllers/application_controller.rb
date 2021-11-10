class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private

    def forbidden
      flash[:alert] = "You are not authorised to perform that acton!"
      # takes you back to where the user was when the request was made
      redirect_to (request.referrer || root_path)
    end
end
