class Admin::ContactsController < Admin::BaseController
  
  def index
    #@contacts = Contact.all
    @contacts = Contact.paginate(:per_page => 20, :page => params[:page] )
    
    respond_to do |wants|
      wants.html # index.html.erb
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    respond_to do |wants|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        wants.html { redirect_to(admin_contacts_url) }
      else
        wants.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |wants|
      flash[:notice] = 'Contact was successfully deleted.'
      wants.html { redirect_to(admin_contacts_url) }
    end
  end

  def generate_csv(context)
    contacts_csv = FasterCSV.generate do |csv|
      # header row
      csv << ["Name", "Email", "City", "State", "Zip"]

      # data rows
      @contacts.each do |contact|        
        if contact.state_id.to_i == 0 || contact.state_id.nil?
          state = "none"
        else
          state = State.find(contact.state_id).name
        end
        
        csv << [contact.name, contact.email, contact.city, state, contact.zip]
      end
      
      @users.each do |user|
        if user.state_id
          state = State.find(user.state_id).name
        end
        
        name = "#{user.firstname} #{user.lastname}"
        
        csv << [name, user.email, user.city, state, user.zipcode]
      end
      
    end

    send_data(contacts_csv, :type => 'text/csv', :filename => "brewgrass_#{context}.csv")
  end
  
  def export_newsletter_subscribers
    @users = User.find_by_sql("select addresses.firstname, addresses.lastname, users.email, addresses.city, addresses.state_id, addresses.zipcode from users left join addresses on users.bill_address_id=addresses.id where addresses.optin = 1")
    @contacts = Contact.optin_eq(1).all
    self.generate_csv("newsletter_subscribers")
  end
  
  def export_all_contacts
    @users = User.find_by_sql("select addresses.firstname, addresses.lastname, users.email, addresses.city, addresses.state_id, addresses.zipcode from users left join addresses on users.bill_address_id=addresses.id")
    @contacts = Contact.all
    self.generate_csv("all_contacts")
  end
  
end