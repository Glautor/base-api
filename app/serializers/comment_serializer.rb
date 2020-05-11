class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :status

  attribute :user do |object|
    object.user.slice(:id, :name, :email)
  end
end
