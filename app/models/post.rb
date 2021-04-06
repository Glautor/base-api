class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  before_destroy :post_has_more_than_10_comments

  def post_has_more_than_10_comments
    raise Utils::Errors::Post::PostHasMoreThanTenComments.new if self.comments.size > 10
  end
end
