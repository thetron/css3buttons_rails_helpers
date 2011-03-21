class Css3buttonsGenerator < Rails::Generators::Base
  desc "Copies css3buttons stylesheets and images"
  source_root File.expand_path('../templates', __FILE__)

  def copy_stylesheets_and_images
    copy_file "public/images/css3buttons_backgrounds.png", "public/images/css3buttons/css3buttons_backgrounds.png"
    copy_file "public/images/css3buttons_icons.png", "public/images/css3buttons/css3buttons_icons.png"
    copy_file "public/stylesheets/css3buttons.css", "public/stylesheets/css3buttons/css3buttons.css"
    copy_file "public/stylesheets/reset.css", "public/stylesheets/css3buttons/reset.css"
    gsub_file "public/stylesheets/css3buttons/css3buttons.css", /\.\.\/images/, "/images/css3buttons"
  end
end
