class Api::V1::WhinersController < BaseController
    before_action :set_whiner, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authentication, only: :create

    def index
        if params[:whiners_per_page]
            @whiners_per_page = params[:whiners_per_page]  
        else
            @whiners_per_page = 8
        end 
        @whiners = Whiner.order("username ASC").page(params[:page]).per(@whiners_per_page)
    end

    def show
    end

    def new
        @whiner = Whiner.new
    end

    def create
        @whiner = Whiner.new(whiner_params)
        if @whiner.save
            WhinerMailer.signup(@whiner).deliver_now
            render json: @whiner, status: :created
        else
            render json: @whiner.errors, status: :unprocessable_entity
        end
    end

    def update
    end

    def edit
    end

    def destroy
        @whiner.destroy
    end

private

    def set_whiner
        @whiner = Whiner.find(params[:id])
    end

    def whiner_params
        params.require(:whiner).permit(:name, :username, :email, :password, :password_confirmation, :avatar)
    end

end
