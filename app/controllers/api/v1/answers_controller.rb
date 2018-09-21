class Api::V1::AnswersController < ApplicationController
    before_action :set_whine
    before_action :set_whiner, only: [:destroy]
    skip_before_action :verify_authentication, only: :show


    def show
    end

    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(answers_params)
        
        if @answer.save
            render json: @answer, status: :created
        else
            render json: @answer.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if current_whiner === @whiner
            @answer.destroy
        end
    end

    def upvote
        @answer_upvote = Answer.find(params[:id])
        @answer_upvote.upvote_by current_whiner
        redirect_to @whine
    end

    def downvote
        @answer_downvote = Answer.find(params[:id])
        @answer_downvote.downvote_by current_whiner
        redirect_to @whine
    end

private
    def set_whiner
        wtest = @whine.whiner_id
        @whiner = Whiner.find(wtest)
    end

    def set_whine
        @whine = Whine.find(params[:whine_id])
    end

    def answers_params
        params.require(:answer).permit(:body, :whiner_id, :whine_id, :answer_image)
    end    
end
