class Api::V1::SessionsController < BaseController

    def create
        whiner = Whiner.find_by_username(params[:username].downcase)
        
        if user && user.authenticate(params[:password])
            render json: { token: whiner.auth_token }
        else
            render json: { error: "Invalid" }, status: :unauthorized
        end
    end

end