class ContactMailer < ActionMailer::Base
  def contact(contact)
    recipients    "#{Spree::Config[:notifications_email]}"
    from          contact.email
    subject       "#{Spree::Config[:notifications_subject]}"
    body          :contact => contact
    sent_on       Time.now
    content_type  "text/html"
  end  
end
