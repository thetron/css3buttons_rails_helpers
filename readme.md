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

In your layout, add the following:

    <%= css3buttons_stylesheets %>

Which will add both the `reset.css` and the `css3buttons.css` stylesheet
link tags. 

_Please note_ since this helper includes the css3buttons
reset stylesheet, it's advisable to place this helper before all your
other stylsheet declarations. However, if you'd like to use your own
reset, you can skip it with:

    <%= css3buttons_stylesheets :include_reset => false %>

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

## Button groups

There's also a helper to automatically add the `left`, `middle` and
`right` classes for grouped buttons.

    <%= button_group do |group| %>
      <%= group.link_button_to "Show", @post %>
      <%= group.link_button_to "Edit", edit_post_path(@post) %>
      <%= group.negative_trash_button_to "Delete", @post %>
    <% end >

# What's missing?

There's a couple of things I've noticed are still missing from the gem,
namely the `big` and `primary` options - which I will add very soon, for
the next release.

The `button_group` helper needs some proper tests, if anyone can point me
as to how to stub out a rails request template in RSpec, that would be much
appreciated!
