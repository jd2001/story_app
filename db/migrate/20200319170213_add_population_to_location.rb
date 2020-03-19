class AddPopulationToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :population, :string
  end
end
