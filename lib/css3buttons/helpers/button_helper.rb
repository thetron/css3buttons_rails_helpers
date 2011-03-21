module Css3buttons
  module Helpers
    module ButtonHelper
      def button_group(&block)
        puts "Warning: Css3buttons::Helpers::ButtonHelper.button_group was called but this method is not yet implemented."
      end      # add the dynamic methods for all button types
      def self.included(base)
        qualifiers = ["", "positive", "negative", "pill", "positive_pill", "negative_pill"]
        icons = ["link", "book","calendar","chat","check","clock","cog","comment","cross","downarrow","fork","heart","home","key","leftarrow","lock","loop","magnifier","mail","move","pen","pin","plus","reload","rightarrow","rss","tag","trash","unlock","uparrow","user"]
        qualifiers.each do |qualifier|
          icons.each do |icon|
            method_name = (qualifier.split("_") + [icon, "button", "to"]).join("_")
            define_method(:"#{method_name}") do |*args, &block|
              icon_tag = (icon != icons.first) ? content_tag(:span, "", :class => "icon #{icon}") : ""
              if block_given?
                options      = args.first || {}
                html_options = args.second
                html_options = add_classes_to_html_options [qualifier.split("_"), 'button'], html_options
                link_to(icon_tag + capture(&block).html_safe, options, html_options)
              else
                name         = args[0]
                options      = args[1] || {}
                html_options = args[2] || {}
                html_options = add_classes_to_html_options [qualifier.split("_"), 'button'], html_options
                link_to(icon_tag + name.html_safe, options, html_options)
              end
            end
          end
        end
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
