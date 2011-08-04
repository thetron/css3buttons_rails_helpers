class Css3buttonsGenerator < Rails::Generators::Base
  desc "Copies css3buttons stylesheets and images"
  source_root File.expand_path('../../../assets', __FILE__)

  def copy_stylesheets_and_images
    copy_file "public/images/gh-icons.png", "public/images/css3buttons/css3-github-buttons-icons.png"
    copy_file "public/stylesheets/css3-github-buttons.css", "public/stylesheets/css3buttons/css3-github-buttons.css"
    copy_file "public/stylesheets/reset.css", "public/stylesheets/css3buttons/reset.css"
  end
end
