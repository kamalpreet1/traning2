class ApplicationController < ActionController::Base
  protect_from_forgery

private
def current_cart
Cart.find(session[:cart_id])
rescue ActiveRecord::RecordNotFound
cart = Cart.create
session[:cart_id] = cart.id
cart
end

def user_visit
  if session[:count].nil?
 session[:count]=0
 
 else
     session[:count]+=1
     
end

session[:count] 
end
end