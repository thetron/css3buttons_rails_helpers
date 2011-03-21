require 'action_controller'
require 'action_view'

module Css3buttons
  module Helpers
    autoload :ButtonHelper, 'css3buttons/helpers/button_helper'
  end
  ActionController::Base.helper(Css3buttons::Helpers::ButtonHelper)
end
