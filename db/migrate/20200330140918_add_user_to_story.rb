class AddUserToStory < ActiveRecord::Migration[6.0]
  def change
    add_reference :stories, :user, foreign_key: true, index: true
  end
end
