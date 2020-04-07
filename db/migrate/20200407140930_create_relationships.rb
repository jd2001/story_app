class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|

      t.timestamps
      t.references :first_character, index: true, foreign_key: {to_table: :characters}
      t.references :second_character, index: true, foreign_key: {to_table: :characters}
    end
  end
end
