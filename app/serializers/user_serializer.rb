class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
  has_many :comments
end
