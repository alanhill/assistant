class LogViewerController < ApplicationController
  before_action :require_admin, only: :index

  def index
    @phone_logs = PhoneLog.all
  end
end
