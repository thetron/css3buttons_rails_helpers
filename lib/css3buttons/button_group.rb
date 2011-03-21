module Css3buttons
  class ButtonGroup
    attr_reader :template, :button_count

    def initialize(template)
      @button_count = 0
      @template = template
    end

    def render(&block)
      add_group_classes(template.capture(self, &block)) if block_given?
    end

    def method_missing(method_name, *args)
      name = args[0]
      options = args[1] || {}
      html_options = args[2] || {}
      html_options[:class] ||= ""
      html_options[:class] += " __css3buttons_group_#{@button_count}__"
      @button_count += 1
      @template.send(method_name, name, options, html_options)
    end

    private
    def add_group_classes(html)
      (0...@button_count).to_a.each do |index|
        if index == 0
          html.gsub! /__css3buttons_group_#{index}__/, "left"
        elsif index == @button_count - 1
          html.gsub! /__css3buttons_group_#{index}__/, "right"
        else
          html.gsub! /__css3buttons_group_#{index}__/, "middle"
        end
      end
      html
    end
  end
end
