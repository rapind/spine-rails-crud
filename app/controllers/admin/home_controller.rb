class Admin::HomeController < ApplicationController
  layout 'admin'
  before_filter :authenticate_administrator!

  def index
  end

end