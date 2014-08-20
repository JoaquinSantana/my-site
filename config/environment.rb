# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.routes.default_url_options[:host] = 'tpanek.herokuapp.com'
Rails.application.initialize!
