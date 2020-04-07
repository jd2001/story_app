class AddDescriptionToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :relationships, :description, :text
  end
end
