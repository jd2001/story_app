class Character < ApplicationRecord
  belongs_to :story
  has_many :relationships
  has_many :related_characters, foreign_key: :second_character, class_name: 'Relationship'
end
