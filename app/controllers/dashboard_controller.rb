class DashboardController < ApplicationController
    def index
        @products_cont = Product.all
        
        @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true).where("featured = ?", true)
    end
end