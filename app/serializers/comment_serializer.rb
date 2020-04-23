class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content

  attribute :user do |object|
    object.user.slice(:id, :name, :email)
  end
end
