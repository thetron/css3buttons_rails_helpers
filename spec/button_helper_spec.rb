require 'spec_helper'
include ActionView::Helpers::UrlHelper
include Css3buttons::Helpers::ButtonHelper

describe Css3buttons::Helpers::ButtonHelper do
  before :each do
    @icons = ["book","calendar","chat","check","clock","cog","comment","cross","downarrow","fork","heart","home","key","leftarrow","lock","loop","magnifier","mail","move","pen","pin","plus","reload","rightarrow","rss","tag","trash","unlock","uparrow","user"]
    @qualifiers = ['pill', 'negative', 'positive']
    @label = "Search this site"
    @path = "/search/site"
  end

  it "should create basic buttons" do
    link = html(link_button_to(@label, @path))

    link.should have_selector("a.button[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}")
    end
  end

  it "should create basic buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"#{icon}_button_to", @label, @path))
      link.should have_selector("a.button[href='#{@path}']")
      link.should have_selector("a.button span.icon.#{icon}")
    end
  end
  it "should create positive buttons" do
    link = html(positive_link_button_to(@label, @path))
    link.should have_selector("a.button.positive[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}") unless qualifier == "positive"
    end
  end

  it "should create negative buttons" do
    link = html(negative_link_button_to(@label, @path))
    link.should have_selector("a.button.negative[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}") unless qualifier == "negative"
    end
  end

  it "should create positive buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"positive_#{icon}_button_to", @label, @path))
      link.should have_selector("a.button.positive[href='#{@path}']")
      link.should have_selector("a.button.positive span.icon.#{icon}")
      @qualifiers.each do |qualifier|
        link.should_not have_selector("a.#{qualifier}") unless qualifier == "positive"
      end
    end
  end

  it "should create negative buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"negative_#{icon}_button_to", @label, @path))
      link.should have_selector("a.button.negative[href='#{@path}']")
      link.should have_selector("a.button.negative span.icon.#{icon}")
      @qualifiers.each do |qualifier|
        link.should_not have_selector("a.#{qualifier}") unless qualifier == "negative"
      end
    end
  end

  it "should create pill buttons" do
    link = html(pill_link_button_to(@label, @path))
    link.should have_selector("a.button.pill[href='#{@path}']")
    @qualifiers.each do |qualifier|
      link.should_not have_selector("a.#{qualifier}") unless qualifier == "pill"
    end
  end

  it "should create pill buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"pill_#{icon}_button_to", @label, @path))
      link.should have_selector("a.button.pill[href='#{@path}']")
      link.should have_selector("a.button.pill span.icon.#{icon}")
      @qualifiers.each do |qualifier|
        link.should_not have_selector("a.#{qualifier}") unless qualifier == "pill"
      end
    end
  end

  it "should create positive pill buttons" do
    link = html(positive_pill_link_button_to(@label, @path))
    link.should have_selector("a.button.pill.positive[href='#{@path}']")
    link.should_not have_selector("a.negative")
  end

  it "should create negative pill buttons" do
    link = html(negative_pill_link_button_to(@label, @path))
    link.should have_selector("a.button.pill.negative[href='#{@path}']")
    link.should_not have_selector("a.positive")
  end

  it "should create positive pill buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"positive_pill_#{icon}_button_to", @label, @path))
      link.should have_selector("a.button.positive.pill[href='#{@path}']")
      link.should have_selector("a.button.positive.pill span.icon.#{icon}")
      link.should_not have_selector("a.negative")
    end
  end

  it "should create negative pill buttons with valid icons" do
    @icons.each do |icon|
      link = html(send(:"negative_pill_#{icon}_button_to", @label, @path))
      link.should have_selector("a.button.negative.pill[href='#{@path}']")
      link.should have_selector("a.button.negative.pill span.icon.#{icon}")
      link.should_not have_selector("a.positive")
    end
  end

  def html(text)
    Capybara::string(text)
  end
end
