class Api::V1::WhinesController < ApplicationController
    before_action :set_whine, only: [:show, :destroy]
    before_action :set_whiner, only: [:destroy]
    skip_before_action :verify_authentication, only: [:index, :show]

    def index         
        @whines = Whine.all
        render 'index.json'
    end

    def show
        render 'show.json'
    end

    def new
        @whine = Whine.new
    end

    def create
        @whine = Whine.new(whines_params)

        if @whine.save 
            render json: @whine, status: :created
        else
            render json: @whine.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if current_whiner === @whiner
            @whine.destroy
        else
            render :show, notice: 'You can only delete your own Whine.'
        end
    end 

private
    def set_whiner
        wtest = @whine.whiner_id
        @whiner = Whiner.find(wtest)
    end

    def set_whine
        @whine = Whine.find(params[:id])
    end

    def whines_params
        params.require(:whine).permit(:title, :body, :whiner_id, :whine_image)
    end
end
