class UsersController < ApplicationController
  before_action :authenticate_request!
end
