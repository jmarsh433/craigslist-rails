class Article < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :category
end
