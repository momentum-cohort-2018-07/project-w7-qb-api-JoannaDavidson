class Api::V1::WhinersController < ApplicationController
    before_action :set_whiner, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authentication, only: :create

    def index
        @whiners = Whiner.all
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
