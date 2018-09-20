class SearchController < ApplicationController
    skip_before_action :verify_authentication

    def index
        if search_params[:search_term].present?
            @results = Whine.search_all_partial_matches(search_params[:search_term]).order("created_at DESC").page(params[:page]).per(8)
        else
            @results = Whine.order("created_at DESC").page(params[:page]).per(8)
        end
    end
  
private
    def search_params
    params.permit(:search_term)
    end
end