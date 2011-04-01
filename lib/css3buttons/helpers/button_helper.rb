module Css3buttons
  module Helpers
    module ButtonHelper
      def method_missing(method, *args)
        if method.to_s.index("button_link_to") || method.to_s.index("button_submit_tag")
          qualifiers = ["primary", "big", "positive", "negative", "pill", "danger", "safe", "button"]
          color_map = {"positive" => "safe", "negative" => "danger"}

          method_qualifiers = method.to_s.split("_")[0...-3] + ["button"]
          method_qualifiers.map! do |qualifier|
            if color_map.has_key?(qualifier)
              qualifier = color_map[qualifier]
            end
            if qualifiers.index(qualifier).nil?
              qualifier = [qualifier, "icon"]
            end
            qualifier
          end.flatten!

          if block_given?
            link = args.first
            options = args.extract_options!
            link_to(link, options, &Proc.new)
          else
            label = args.first
            link = args[1]
            options = args.extract_options!
            options = add_classes_to_html_options(method_qualifiers, options)
            link_to(label, link, options)
          end
        else
          super
        end
      end

      def css3buttons_stylesheets(options = {})
        options[:include_reset] = true unless options.has_key?(:include_reset)
        if options[:include_reset] == true
          stylesheet_link_tag "css3buttons/reset", "css3buttons/css3buttons"
        else
          stylesheet_link_tag "css3buttons/css3buttons"
        end
      end

      def button_group(*args, &block)
        options = args.extract_options!
        group = Css3buttons::ButtonGroup.new(self, options)
        group.render(&block) if block_given?
      end

      protected
      def add_classes_to_html_options(classes, html_options = {})
        classes = classes.delete_if{|c| c.blank?}
        html_options ||= {}
        html_options[:class] ||= ""
        html_options[:class] = (html_options[:class].split(" ") + classes).join(" ")
        html_options
      end
    end
  end
end
