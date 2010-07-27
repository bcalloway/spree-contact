class ContactMailer < ActionMailer::Base
  def contact(contact)
    recipients    "info@brewgrassfestival.com"
    from          contact.email
    subject       "New email from BrewgrassFestival.com"
    body          :contact => contact
    sent_on       Time.now
    content_type  "text/html"
  end  
end
