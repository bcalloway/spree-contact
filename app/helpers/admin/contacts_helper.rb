module Admin::ContactsHelper
  
  def show_state(state)
    if !state.nil? || state.to_i != 0
      @state = State.find(state)
      return @state.name
    else
      return nil
    end
  end
  
end
