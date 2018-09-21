class WhinersController < ApplicationController
    before_action :set_whiner, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authentication

    def index
        @whiners = Whiner.order("username ASC").page(params[:page]).per(8)
    end

    def show
    end

    def new
        @whiner = Whiner.new
    end

    def edit
    end

    def create
        @whiner = Whiner.new(whiner_params)
        if @whiner.save
            WhinerMailer.welcome_email(@whiner).deliver_now
            redirect_to @whiner, notice: 'Account created. Please log in.'
        else
            render 'new'
        end
    end

    def update
        if @whiner.update(whiner_params.reject(:username))
          redirect_to @whiner, notice: 'Whiner info successfully updated.'
        else
          render :edit
        end
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
