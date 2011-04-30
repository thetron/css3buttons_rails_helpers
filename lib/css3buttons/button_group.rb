module Css3buttons
  class ButtonGroup
    include ActionView::Helpers::TagHelper
    attr_reader :template, :button_count, :options

    def initialize(template, options)
      @button_count = 0
      @template = template
      @options = options
      @options[:wrapper_tag] ||= :div
    end

    def render(&block)
      html_options = @options
      html_options.delete(:wrapper_tag)
      html_options[:class] ||= ''
      html_options[:class] = (html_options[:class].split(" ") + ['button-group']).join(" ")
      html_options[:class] = (html_options[:class].split(" ") + ['minor-group']).join(" ") if @options[:minor]
      html_options.delete(:minor)
      content_tag(:div, @template.capture(&block), html_options) if block_given?
    end
  end
end

