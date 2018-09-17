class WhinersController < ApplicationController
    before_action :set_whiner, only: [:show, :edit, :update, :destroy]

    def index
        @whiners = Whiner.page(params[:page]).per(8)
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
            redirect_to @whiner, notice: 'Account created. Please log in.'
        else
            render 'new'
        end
    end

    def update
    end

    def edit
    end

    def destroy
        @user.destroy
    end

private

    def set_whiner
        @whiner = Whiner.find(params[:id])
    end

    def whiner_params
        params.require(:whiner).permit(:name, :username, :email, :password, :password_confirmation, :avatar)
    end

end
