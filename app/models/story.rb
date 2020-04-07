class Story < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :locations
  has_many :histories
end
