require 'compass/import-once/activate'
# Require any additional compass plugins here.

# Make a copy of sprites with a name that has no uniqueness of the hash.
on_sprite_saved do |filename|
  if File.exists?(filename)
	FileUtils.cp filename, filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
	# Note: Compass outputs both with and without random hash images.
	# To not keep the one with hash, add: (Thanks to RaphaelDDL for this)
	FileUtils.rm_rf(filename)
  end
end

# # Replace in stylesheets generated references to sprites
# # by their counterparts without the hash uniqueness.
on_stylesheet_saved do |filename|
  if File.exists?(filename)
  	css = File.read filename
  	File.open(filename, 'w+') do |f|
  	  f << css.gsub(%r{-(?<version>s[a-z0-9]{10})\.png}, '.png?\\k<version>')
  	end
  end
end

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "styles/stylesheets"
sass_dir = "styles/sass"
images_dir = "images"
javascripts_dir = "scripts"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false

relative_assets = true
line_comments = false

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
