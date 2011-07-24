module Css3buttons
  class SplitButtonGroup
    include Css3buttons::Helpers::SplitButtonHelper
    attr_reader :template, :button_count, :options

    def initialize(template, options)
      @button_count = 0
      @template = template
      @options = options
      @options[:wrapper_tag] ||= :div
    end

    def render(&block)
      # parse the passed in block's content
      content = @template.capture(&block)
      
      render_split_button(content, @options) if block_given?
    end
  end
end

