class WhinesController < ApplicationController
    before_action :set_whine, only: [:show, :destroy]
    before_action :set_whiner, only: [:destroy]
    before_action :set_whiner_whines, :set_whiner_answers, :set_best_answers, :set_whiniest, only: [:index, :show]
    skip_before_action :verify_authentication
    

    def index
        @whines = Whine.order("created_at DESC").page(params[:page]).per(8)
    end

    def show
    end

    def new
        @whine = Whine.new
    end

    def create
        @whine = Whine.new(whines_params)

        if @whine.save 
            redirect_to @whine, notice: 'Whining successful.'
        else
            render 'new'
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

    def set_whiner_whines
        @all_whiner_whines = Whine.select { |w| w.whiner_id === current_whiner.id } if current_whiner
        @recent_whines = @all_whiner_whines.last(5) if current_whiner
    end
    
    def set_whiner_answers
        @all_whiner_answers = Answer.select { |a| a.whiner_id === current_whiner.id } if current_whiner
        @recent_answers = @all_whiner_answers.last(5) if current_whiner
    end

    def set_whiniest
        @whiniest = Answer.all
    end

    def set_best_answers
        @recent_best_answers = Answer.select { |ba| ba.best_answer }.last(5)
    end

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
