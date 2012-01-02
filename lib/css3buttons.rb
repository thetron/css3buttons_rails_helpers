require 'action_controller'
require 'action_view'

module Css3buttons 
  require 'css3buttons/engine'
  module Helpers
    autoload :ButtonHelper, 'css3buttons/helpers/button_helper'
    autoload :SplitButtonHelper, 'css3buttons/helpers/split_button_helper'
  end
  autoload :ButtonGroup, 'css3buttons/button_group'
  autoload :SplitButtonGroup, 'css3buttons/split_button_group'
  ActionController::Base.helper(Css3buttons::Helpers::ButtonHelper)
  ActionController::Base.helper(Css3buttons::Helpers::SplitButtonHelper)
end
