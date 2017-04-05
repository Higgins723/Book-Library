class Author < ApplicationRecord
  belongs_to :book

  # validation
  validates_presence_of :name
end
