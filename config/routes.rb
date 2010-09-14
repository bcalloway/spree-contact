map.resources :contacts
map.contact '/contact', :controller => :contacts, :action => :new
map.thanks '/thanks', :controller => :contacts, :action => :thanks

map.namespace :admin do |admin|
  admin.resources :contacts
  admin.export_newsletter_subscribers '/contacts/export/newsletter', :controller => :contacts, :action => :export_newsletter_subscribers
  admin.export_all_contacts '/contacts/export/all', :controller => :contacts, :action => :export_all_contacts
end