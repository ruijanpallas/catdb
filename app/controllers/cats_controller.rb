class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
  end

  def show
   @cat = Cat.first
  end
  
end
