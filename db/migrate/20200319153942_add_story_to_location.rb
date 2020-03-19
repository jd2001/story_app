class AddStoryToLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :story, null: false, foreign_key: true, index: true
  end
end
