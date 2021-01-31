class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.find{ cocktail_id == @cocktail }
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new
    @cocktail = Cocktail.create(cocktail_params)
    @cocktail.save

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url)
  end
end
