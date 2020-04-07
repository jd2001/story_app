class Relationship < ApplicationRecord
  belongs_to :first_character, class_name: 'Character'
  belongs_to :second_character, class_name: 'Character'

  def other_character (current_character)
    if self.first_character == current_character
      self.second_character
    else
      self.first_character
    end
  end
end
