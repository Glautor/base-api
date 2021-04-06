class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_presence_of :content
  enum status: %w[published filed draft]
end
