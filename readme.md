# css3buttons gem - helper methods for css3buttons

The css3buttons gem is a small set of helper methods designed to work in
conjunction with the __awesome__ [css3buttons by Michael Henriksen](http://css3buttons.michaelhenriksen.dk).

The helpers allow rails developers to quickly and easily leverage this
fantastic CSS library - without cluttering up your views and calls to
`link_to`.

# Getting started

Include the gem in your gemfile:

    gem 'css3buttons'

Run the generators

    $ rails g css3buttons:stylesheets

Which will copy the stylesheets and icon/button images into your public
directory.

# The basics

To change your `link_to` calls to buttons, simply use `link_button_to`.
For example:

    <%= link_button_to "Search", search_path %>

The helper method accept all the same parameters as `link_to` to
upgrading and downgrading so css3buttons should be a snap.


# Icons and pills and colours, oh my!

The gem also creates a huge stack of dynamic helpers, to assist in adding
icons, colours and styles to your buttons.

## Icons

To add an icon from [the current icon list](http://css3buttons.michaelhenriksen.dk/), simply replace `link` in the helper method with the name of the icon you'd like to use. For example:

    <%= magnifier_button_to "Search", search_path %>
    <%= user_button_to "Account", edit_current_user_path %>
    <%= pin_button_to "Mark on map", edit_map_path %>

## Styles

Just like the icons, simply prepend your button calls with `pill_`:

    <%= pill_link_button_to "Archive", archive_path %>

## Colors

Again with colors - simply add `positive_` or `negative_` to the front
of your method call:

    <%= negative_trash_button_to "Delete", delete_path %>
    <%= positive_pill_reload_button_to "Reload", reload_path %>

# Coming soon... button groups

To take the headaches out of managing button groups, we're currently
working to implement a method which will accept blocks and automatically
add the `.left`, `.middle` and `.right` classes as required.
