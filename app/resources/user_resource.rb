class UserResource < JSONAPI::Resource
  attributes :email, :password, :password_confirmation, :authorized_assignments

end
