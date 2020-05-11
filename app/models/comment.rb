class Comment < ApplicationRecord
  belongs_to :user
  validates_presence_of :content
  enum status: %w[published filed draft]
end
