module Css3buttons
  module Helpers
    module SplitButtonHelper
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::UrlHelper
      
      def render_split_button(content, options)
        html_options = options.clone
        html_options.delete(:wrapper_tag)
        html_options.delete(:pill)
        html_options[:class] ||= ''
        html_options[:class] = (html_options[:class].split(" ") + ['split-button-group']).join(" ")
        html_options[:class] = (html_options[:class].split(" ") + ['pill-group']).join(" ") if options[:pill]
        
        # convert the string to an array of links
        links = content.strip.gsub(/\r*?\n+\t*?\s+/, "::").split("::")
        
        # pass the creation of the button off to the helpers
        split_btn = create_split_button(links, options)

        # return the final split button + wrapping element
        content_tag(options[:wrapper_tag], split_btn, html_options)
      end
      
      # extracts the first link from the array and 
      # keeps it as the main action and creates the
      # markup for the main action + dropdown button
      def create_split_button(links, options)
        main_action = links.shift 
        dropdown    = create_dropdown(links, options)
        content_tag(:ul, content_tag(:li, main_action, :class => 'split main') + dropdown, :class => 'split-menu-wrap')
      end
      
      # creates the drop down's button + menu
      def create_dropdown(links, options)
        menu = create_dropdown_menu(links)

        dropdown_link_classes =  "dropdown icon button"
        dropdown_link_classes += " pill" if options[:pill]
        dropdown_link = link_to "", "javascript:void(0);", :class => dropdown_link_classes

        content_tag(:li,  dropdown_link.html_safe + menu, :class => 'split dropdown')
      end
      
      # wrap the remaining links in an <li> tag
      # and insert it into a <ul> element
      def create_dropdown_menu(links)
        list = links.map { |link| content_tag(:li, link, :class => 'split-menu-item') }
        content_tag(:ul, list.join("\n").html_safe, :class => 'split-menu')
      end
    end
  end
end