class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description

  attribute :user do |object|
    object.user.slice(:id, :name, :email)
  end
end
