class AddReferencesToDoses < ActiveRecord::Migration[6.0]
  def change
    add_reference :doses, :cocktail, index: true
    add_reference :doses, :ingredient, index: true
  end
end
