class CocktailsController < ApplicationController
    def index
    @cocktails = Cocktail.all
    end

    def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
    end

    def edit
    @cocktail = Cocktail.find(params[:id])
    end

    def new
    @cocktail = Cocktail.new
    end

    def create
        @cocktail = Cocktail.new(cocktail_params)

        if @cocktail.save
          redirect_to @cocktail, notice: 'Cocktail was successfully created.'
        else
          render :new
        end
    end

    def update
        @cocktail = Cocktail.find(params[:id])
        if @cocktail.update(cocktail_params)
          redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
        else
          render :edit
        end
      end
    

    def destroy
        @cocktail = Cocktail.find(params[:id])
        @cocktail.destroy
        @cocktail.photos.purge
    redirect_to cocktails_path

    end
    
    private

    def cocktail_params
        params.require(:cocktail).permit(:name, :photos, :description, :instructions)
    end

    
end
