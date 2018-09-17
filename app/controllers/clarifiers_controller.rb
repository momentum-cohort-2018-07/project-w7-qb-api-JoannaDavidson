class ClarifiersController < ApplicationController
    before_action :set_whine
    before_action :set_whiner, only: [:destroy]

    def show
    end

    def new
        @clarifier = Clarifier.new
    end

    def create
        @clarifier = Clarifier.new(clarifiers_params)
        
        if @clarifier.save
            redirect_to @whine, notice: 'Clarifier successful.'
        else
            render 'new'
        end
    end

    def destroy
        if current_whiner === @whiner
            @clarifier.destroy
        end
    end

private
    def set_whiner
        wtest = @whine.whiner_id
        @whiner = Whiner.find(wtest)
    end

    def set_whine
        @whine = Whine.find(params[:whine_id])
    end

    def clarifiers_params
        params.require(:clarifier).permit(:body, :whiner_id, :whine_id)
    end    
end
