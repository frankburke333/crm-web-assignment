require_relative 'contact'

require 'sinatra'

Contact.create('Frank', 'Burke', 'frank@bitmakerlabs.com', 'Developer')
Contact.create('Walter', 'Bass', 'walter@bitmakerlabs.com', 'Developer')
Contact.create('Donald', 'Trump', 'douche@bitmakerlabs.com', 'Developer')
Contact.create('John', 'Maclean', 'die_hard@bitmakerlabs.com', 'Developer')

get '/' do
  @crm_app_name = "Bitmaker's CRM"
  @crm_date = "Jan 24 2017"
  erb :index
end

get '/contacts' do
    @contact_count = Contact.all.count
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end


post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')

end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  erb :show_contact
end
