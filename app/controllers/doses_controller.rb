class DosesController < ApplicationController
  before_action :set_cocktail, except: [:destroy]
  def index
    @dose = Dose.all
  end


  def new
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose  = Dose.new
    # @ingredients = Ingredient.all
  end

  def create
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose.cocktail = @cocktail
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])

    @cocktail = Cocktail.find(@dose.cocktail_id)

    @dose.destroy
    redirect_to cocktail_path(@cocktail)

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose

  end


end
