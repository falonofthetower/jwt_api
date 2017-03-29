class UserResource < JSONAPI::Resource
  attributes :email, :password, :password_confirmation
end
