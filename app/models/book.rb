class Book < ApplicationRecord
  # model association
  has_many :authors, dependent: :destroy

  # validations
  validates_presence_of :title, :description
end