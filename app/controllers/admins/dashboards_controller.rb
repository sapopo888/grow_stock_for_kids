class Admins::DashboardsController < ApplicationController
  layout "admins/layouts/application"
  before_action :authenticate_admin!

  def index; end
end
