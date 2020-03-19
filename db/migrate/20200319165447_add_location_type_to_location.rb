class AddLocationTypeToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :location_type, :string
  end
end
