class LoggedController < ApplicationController
  before_action :logged?
end
