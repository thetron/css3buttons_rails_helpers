require 'spec_helper'

include ActionView::Helpers::UrlHelper
include Css3buttons::Helpers::ButtonHelper

describe Css3buttons::ButtonGroup do
  before :each do
    stub_template "posts/_actions.html.erb" => "<= button_group do\nlink_button_to 'show', '/post/345'\nlink_button_to 'edit', '/post/345/edit'\nlink_button_to 'delete', '/post/345'"
  end

  it "should add a class of first to the first link" do
    render
    puts rendered
  end
end
