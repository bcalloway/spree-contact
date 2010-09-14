if Spree::Config.instance
  Spree::Config.set(:notifications_email => "info@mysite.com,fred@github.com")
  Spree::Config.set(:notifications_subject => "New Contact email at ABC Site Name")
end