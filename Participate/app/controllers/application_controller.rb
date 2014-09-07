class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @shapes = Shape.inactive.all
    @drums = Drum.all
    @steps = Step.order('position asc').all
  end
end
