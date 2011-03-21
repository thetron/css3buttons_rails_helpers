module Css3buttons
  module Helpers
    autoload :ButtonHelper, 'css3buttons/helpers/button_helper'
  end
  ActionController::Base.helper(Css3buttons::Helpers::ButtonHelper)
end
