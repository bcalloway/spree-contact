if Spree::Config.instance
  Spree::Config.set(:notifications_email => "info@example.com")
  Spree::Config.set(:notifications_subject => "New Contact email at Example Site Name")
end
