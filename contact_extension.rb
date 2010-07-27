# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ContactExtension < Spree::Extension
  version "1.0"
  description "Spree Contact Form"
  url "http://github.com/bcalloway/spree-contact"

  # Please use contact/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
    
    State.class_eval do
      has_many :contacts
    end
    
  end
end
