require 'spec_helper'
include ActionView::Helpers::UrlHelper
include Css3buttons::Helpers::ButtonHelper

describe Css3buttons::Helpers::ButtonHelper do
  before :each do
    @icons = ["book","calendar","chat","check","clock","cog","comment","cross","downarrow","fork","heart","home","key","leftarrow","lock","loop","magnifier","mail","move","pen","pin","plus","reload","rightarrow","rss","tag","trash","unlock","uparrow","user","dropdown"]
    @qualifiers = ['pill', 'negative', 'positive', 'danger', 'safe']
    @label = "Search this site"
    @path = "/search/site"
  end

  #--- basic buttons

  it "should create basic buttons" do
    link = html(button_link_to(@label, @path))

    link.should have_selector("a.button[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}")
    end
  end
  it "should create basic submit buttons" do
    button = html(button_submit_tag(@label))

    button.should have_selector("input.button[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("input.#{qualifier}")
    end
  end
  it "should create basic button tags" do
    button = html(button_tag(@label))
    button.should have_selector("button.button")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("button.#{qualifier}")
    end
  end

  #--- basic buttons with icons

  it "should create basic buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"#{icon}_button_link_to", @label, @path))
      link.should have_selector("a.button.icon.#{icon}[href='#{@path}']")
    end
  end
  it "should create basic button tags with valid icons" do
    @icons.each do |icon|
      button = html(send(:"#{icon}_button_tag", @label))
      button.should have_selector("button.button.icon.#{icon}[type='submit']")
    end
  end

  #--- positive buttons

  it "should create positive buttons" do
    link = html(positive_button_link_to(@label, @path))
    link.should have_selector("a.button.safe[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}") unless qualifier == "safe"
    end
  end
  it "should create positive submit buttons" do
    button = html(positive_button_submit_tag(@label))
    button.should have_selector("input.button.safe[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("input.#{qualifier}") unless qualifier == "safe"
    end
  end
  it "should create positive button tags" do
    button = html(positive_button_tag(@label))
    button.should have_selector("button.button.safe[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("button.#{qualifier}") unless qualifier == "safe"
    end
  end

  #--- negative buttons

  it "should create negative buttons" do
    link = html(negative_button_link_to(@label, @path))
    link.should have_selector("a.button.danger[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}") unless qualifier == "danger"
    end
  end
  it "should create negative submit buttons" do
    button = html(negative_button_submit_tag(@label))
    button.should have_selector("input.button.danger[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("input.#{qualifier}") unless qualifier == "danger"
    end
  end
  it "should create negative button tags" do
    button = html(negative_button_tag(@label))
    button.should have_selector("button.button.danger[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("button.#{qualifier}") unless qualifier == "danger"
    end
  end

  #--- positive buttons with icons

  it "should create positive buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"positive_#{icon}_button_link_to", @label, @path))
      link.should have_selector("a.button.safe.icon.#{icon}[href='#{@path}']")
      @qualifiers.each do |qualifier|
        link.should_not have_selector("a.#{qualifier}") unless qualifier == "safe"
      end
    end
  end
  it "should create positive button tags with valid icons" do
    @icons.each do |icon|
      button = html(send(:"positive_#{icon}_button_tag", @label))
      button.should have_selector("button.button.safe.icon.#{icon}[type='submit']")
      @qualifiers.each do |qualifier|
        button.should_not have_selector("button.#{qualifier}") unless qualifier == "safe"
      end
    end
  end

  #--- negative buttons with icons

  it "should create negative buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"negative_#{icon}_button_link_to", @label, @path))
      link.should have_selector("a.button.danger.icon.#{icon}[href='#{@path}']")
      @qualifiers.each do |qualifier|
        link.should_not have_selector("a.#{qualifier}") unless qualifier == "danger"
      end
    end
  end
  it "should create negative button tags with valid icons" do
    @icons.each do |icon|
      button = html(send(:"negative_#{icon}_button_tag"))
      button.should have_selector("button.button.danger.icon.#{icon}[type='submit']")
      @qualifiers.each do |qualifier|
        button.should_not have_selector("button.#{qualifier}") unless qualifier == "danger"
      end
    end
  end

  #--- pill buttons

  it "should create pill buttons" do
    link = html(pill_button_link_to(@label, @path))
    link.should have_selector("a.button.pill[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}") unless qualifier == "pill"
    end
  end
  it "should create pill submit buttons" do
    button = html(pill_button_submit_tag(@label))
    button.should have_selector("input.button.pill[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("input.#{qualifier}") unless qualifier == "pill"
    end
  end
  it "should create pill button tags" do
    button = html(pill_button_tag(@label))
    button.should have_selector("button.button.pill[type='submit']")
    @qualifiers.each do |qualifier|
      button.should_not have_selector("button.#{qualifier}") unless qualifier == "pill"
    end
  end

  #--- pill buttons with icons

  it "should create pill buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"pill_#{icon}_button_link_to", @label, @path))
      link.should have_selector("a.button.pill.icon.#{icon}[href='#{@path}']")
      @qualifiers.each do |qualifier|
        link.should_not have_selector("a.#{qualifier}") unless qualifier == "pill"
      end
    end
  end
  it "should create pill button tags with valid icons" do
    @icons.each do |icon|
      button = html(send(:"pill_#{icon}_button_tag", @label))
      button.should have_selector("button.button.pill.icon.#{icon}[type='submit']")
      @qualifiers.each do |qualifier|
        button.should_not have_selector("button.#{qualifier}") unless qualifier == "pill"
      end
    end
  end

  #--- positive pill buttons

  it "should create positive pill buttons" do
    link = html(positive_pill_button_link_to(@label, @path))
    link.should have_selector("a.button.pill.safe[href='#{@path}']")
    link.should_not have_selector("a.danger")
  end
  it "should create positive pill submit buttons" do
    button = html(positive_pill_button_submit_tag(@label))
    button.should have_selector("input.button.pill.safe[type='submit']")
    button.should_not have_selector("input.danger")
  end
  it "should create positive pill button tags" do
    button = html(positive_pill_button_tag(@label))
    button.should have_selector("button.button.pill.safe[type='submit']")
    button.should_not have_selector("button.danger")
  end

  #--- negative pill buttons

  it "should create negative pill buttons" do
    link = html(negative_pill_button_link_to(@label, @path))
    link.should have_selector("a.button.pill.danger[href='#{@path}']")
    link.should_not have_selector("a.safe")
  end
  it "should create negative pill submit buttons" do
    button = html(negative_pill_button_submit_tag(@label))
    button.should have_selector("input.button.pill.danger[type='submit']")
    button.should_not have_selector("input.safe")
  end
  it "should create negative pill button tags" do
    button = html(negative_pill_button_tag(@label))
    button.should have_selector("button.button.pill.danger[type='submit']")
    button.should_not have_selector("button.safe")
  end

  #--- positive pill buttons with icons

  it "should create positive pill buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"positive_pill_#{icon}_button_link_to", @label, @path))
      link.should have_selector("a.button.safe.pill.icon.#{icon}[href='#{@path}']")
      link.should_not have_selector("a.danger")
    end
  end
  it "should create positive pill button tags with valid icons" do
    @icons.each do |icon|
      button = html(send(:"positive_pill_#{icon}_button_tag", @label))
      button.should have_selector("button.button.safe.pill.icon.#{icon}[type='submit']")
      button.should_not have_selector("button.danger")
    end
  end

  #--- negative pill buttons with icons

  it "should create negative pill buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"negative_pill_#{icon}_button_link_to", @label, @path))
      link.should have_selector("a.button.danger.pill.icon.#{icon}[href='#{@path}']")
      link.should_not have_selector("a.safe")
    end
  end
  it "should create negative pill button tags with valid icons" do
    @icons.each do |icon|
      button = html(send(:"negative_pill_#{icon}_button_tag", @label))
      button.should have_selector("button.button.danger.pill.icon.#{icon}[type='submit']")
      button.should_not have_selector("button.safe")
    end
  end

  #--- end

  def html(text)
    Capybara::string(text)
  end
end
