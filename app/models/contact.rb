class Contact < ActiveRecord::Base
  
  belongs_to :state
  validates_presence_of :name, :email, :message
  
  def deliver_contact
    ContactMailer.deliver_contact(self)
  end
  
end
