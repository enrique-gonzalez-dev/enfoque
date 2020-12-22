# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

CRYPTO_CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/application.yml")).result)[Rails.env]

#Paperclip::Attachment.default_options[:url] = "/system/:class/:attachment/:id/:style/:filename"
