require 'spec_helper'

include ActionView::Helpers::UrlHelper
include Css3buttons::Helpers::ButtonHelper

describe Css3buttons::ButtonGroup do
  before :each do
    @template = MockTemplate.new
    @template.button_group do
      pill_button_link_to "View", "/post/346"
      pill_button_link_to "Edit", "/post/346/edit"
      negative_trash_pill_button_link_to "Delete", "/post/346", :method => :delete, :confirm => "Are you sure?"
    end
  end

  it "should add a class of first to the first link" do
    render
    puts rendered
  end
end

class MockTemplate
  include Css3Buttons::Helpers::ButtonHelper
  include ActionView::Helpers::TagHelper
  #requires the output buffer junk - blerg
end
