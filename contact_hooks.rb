class ContactHooks < Spree::ThemeSupport::HookListener
  
  insert_after :admin_tabs do
    %(<%= tab(:label => "Contacts", :route => :admin_contacts) %>) 
  end

end
