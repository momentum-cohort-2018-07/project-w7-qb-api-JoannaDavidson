class Api::V1::WhinesController < BaseController
    before_action :set_whine, only: [:show, :destroy]
    before_action :set_whiner, only: [:destroy]
    

    def index         
        @whines = Whine.all
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
