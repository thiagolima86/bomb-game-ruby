require 'active_support/all'
require './config/application.rb'

config = Config::Application
config.load(%i[number feedback input_validate input_number], 'lib')
config.load(%i[application configure], 'lib/helpers')

# Config i18n
I18n.load_path << Dir[File.expand_path("./config/locales") + "/*.yml"]
I18n.default_locale = :en
