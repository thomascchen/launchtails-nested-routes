class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/drinks'
    else
      render :new
    end
  end

  def index
    if params[:category_id] == nil
      @drinks = Drink.all
    else
      @drinks = Category.find(params[:category_id]).drinks
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
