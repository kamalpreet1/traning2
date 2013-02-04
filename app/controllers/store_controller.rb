class StoreController < ApplicationController
  def index
    @products = Product.all
   @counter=user_visit
  end
end
