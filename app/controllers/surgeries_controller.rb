class SurgeriesController < ApplicationController
  def index 
    @surgeries = Surgery.all
  end

  def show 
    @surgery = Surgery.find(params[:id])
    @surgeries = Surgery.all
  end

  
end