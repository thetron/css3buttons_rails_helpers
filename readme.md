# css3buttons-rails gem

Integrate Nicholas Bruning's css3buttons_rails_helpers into Rails3.1+ via the asset pipeline.

The css3buttons-rails gem is a small set of helper methods designed to work in
conjunction with the __amazing__ [css3 github buttons by Nicolas Gallagher](http://nicolasgallagher.com/lab/css3-github-buttons/).

The helpers allow rails developers to quickly and easily leverage this
fantastic CSS library - without cluttering up your views and calls to
`link_to`, `button_to` and `submit_tag`.

# What's new in version this version?

In this version we've updated the css to now work with the [css3 github buttons](http://nicolasgallagher.com/lab/css3-github-buttons/) as standard, instead of the original css3buttons, in order to take advantage of a few of the features not included in the original library.

Additionally, there was some serious re-tooling of the helper methods to make them more usable, more dynamic and less prone to error.

__Please note__: as part of changes, calls to `link_button_to` will need
to be updated to `button_link_to`. Everything else should work expected.


# Getting started

Include the gem in your gemfile and rum *bundle*

    gem 'css3buttons-rails'

Require the assets (stylesheets) in your *app/asstes/stylesheets/application.css*

	*= require css3buttons
	*= require_self
	...
	
You should require the css3buttons stylesheet before any other styles because it loads a css reset script. If you don't want to load the reset script, just require this instead

	*= require css3buttons/without-reset
	*= require_self
	...


# The basics

To change your `link_to` calls to buttons, simply use `button_link_to`.
For example:

    <%= button_link_to "Search", search_path %>

The helper methods accept all the same parameters as `link_to` so
upgrading and downgrading to css3buttons should be a snap.


# Icons and pills and colours, oh my!

The gem also responds to a huge list of dynamic helper methods, to assist in adding
icons, colours and styles to your buttons. Unlike previous versions of
the gem, you can now add any of the features in any order.


## Icons

To add an icon from [the current icon list](http://nicolasgallagher.com/lab/css3-github-buttons/), simply prepend the helper method with the name of the icon you'd like to use. For example:

    <%= magnifier_button_link_to "Search", search_path %>
    <%= user_button_link_to "Account", edit_current_user_path %>
    <%= pin_button_link_to "Mark on map", edit_map_path %>


## Styles

Just like the icons, you can add options for `primary`, `big` and
`pill`.

    <%= primary_button_link_to "Home", root_path %>
    <%= pill_button_link_to "Archive", archive_path %>
    <%= big_primary_pill_button_link_to "Super Important!", super_important_path %>


## Colors

Again with colors - simply add `positive` or `negative` to the front of your method call:

    <%= negative_trash_button_link_to "Delete", delete_path %>
    <%= positive_pill_reload_button_link_to "Reload", reload_path %>

In order to be compatible with the new css3 github buttons library, you can also use `danger` and `safe` - as alternatives.


## Button groups

Button groups are snap, you just need to wrap your buttons with `button_group`, like so:

    <%= button_group do %>
      <%= button_link_to "Show", @post %>
      <%= button_link_to "Edit", edit_post_path(@post) %>
      <%= negative_trash_button_link_to "Delete", @post, :confirm => "Are you sure? %>
    <% end %>

And, of course, minor groups:

    <%= minor_button_group do %>
      You know the drill by now.
    <% end %>


## Submit tags, button tags and using icons on form buttons

Submit tags were ushered in with version 0.9.2. Everything works as it does above, except instead of `button_link_to` it's `button_submit_tag`. Example:

    <%= positive_button_submit_tag "Publish" %>

Keep in mind however, that icons do not work on `<submit>` tags. If you're wanting to include icons in your forms there is also a helper method to insert `<button>` tags instead. The method suffix in this case is `button_tag`. Examples:

    <%= approve_button_tag "Update profile" %>
    <%= negative_trash_button_tag "Deactivate account" %>


# Formtastic compatibility

If you're using
[formtastic](https://github.com/justinfrench/formtastic), you may
experience issues with using css3buttons in your forms, due to the
way the built-in formtastic styles modify default form buttons. In this
instance, you can insert the following into your
`formtastic_changes.css` stylesheet.

    form.formtastic input.button, form.formtastic.button.button {
      height: 25px;
      padding: 0.2em 1em 0.2em 2.5em;
      font-family: sans-serif;
      font-size: 11px;
      margin-left: 5px;
    }

CSS Snippet courtesy of [vitobotta](https://github.com/vitobotta).



# What's missing?

The `button_group` helper needs some proper tests, if anyone can point me as to how to stub out a rails request template in RSpec (or the right way to approach this test at all), that would be much appreciated!

I've noticed that this version of the css3 github buttons does not include any colours for the positive/safe styles - so this will appear as normal buttons, unless you add your own styling.

Forks and pull requests are always welcome.
