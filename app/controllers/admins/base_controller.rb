class Admins::BaseController < ApplicationController
  layout "admins/layouts/application"
  before_action :authenticate_admin!
end
