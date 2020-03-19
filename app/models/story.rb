class Story < ApplicationRecord
  has_many :characters
  has_many :locations
  has_many :histories
end
