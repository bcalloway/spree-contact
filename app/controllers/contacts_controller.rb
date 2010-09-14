class ContactsController < Spree::BaseController

  def new
    @contact = Contact.new

    respond_to do |wants|
      wants.html # new.html.erb
    end
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |wants|
      if @contact.save
        @contact.deliver_contact
        #flash[:notice] = 'Contact was successfully created.'
        wants.html { redirect_to('/thanks') }
      else
        wants.html { render :action => "new" }
      end
    end
  end
  
  def thanks
  end

end