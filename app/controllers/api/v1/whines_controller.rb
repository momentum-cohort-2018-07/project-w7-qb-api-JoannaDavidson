class Api::V1::WhinesController < BaseController
    before_action :set_whine, only: [:show, :destroy]
    before_action :set_whiner, only: [:destroy]
    

    def index
        if params[:whines_per_page]
            @whines_per_page = params[:whines_per_page]  
        else
            @whines_per_page = 8
        end          
        @whines = Whine.order("created_at DESC").page(params[:page]).per(@whines_per_page)
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
