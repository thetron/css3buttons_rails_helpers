class Css3buttonsGenerator < Rails::Generators::Base
  desc "Copies css3buttons stylesheets and images"
  source_root File.expand_path('../../../assets', __FILE__)

  def copy_stylesheets_and_images
<<<<<<< HEAD
    copy_file "public/images/gh-icons.png", "public/images/css3buttons/css3-github-buttons-icons.png"
    copy_file "public/stylesheets/css3-github-buttons.css", "public/stylesheets/css3buttons/css3-github-buttons.css"
    copy_file "public/stylesheets/reset.css", "public/stylesheets/css3buttons/reset.css"
=======
    copy_file "images/css3buttons/css3-github-buttons-icons.png", "public/images/css3buttons/css3-github-buttons-icons.png"
    copy_file "stylesheets/css3buttons/css3-github-buttons.css", "public/stylesheets/css3buttons/css3-github-buttons.css"
    copy_file "stylesheets/css3buttons/reset.css", "public/stylesheets/css3buttons/reset.css"
    gsub_file "public/stylesheets/css3buttons/css3-github-buttons.css", /url\(css3buttons/, "url(/images/css3buttons"
>>>>>>> 396789eba4ceb21d3131e60f8ea083824bdc9166
  end
end
