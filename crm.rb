require_relative 'contact'

require 'sinatra'

Contact.create('Frank', 'Burke', 'frank@bitmakerlabs.com', 'Developer')

get '/' do
  @crm_app_name = "Bitmaker's CRM"
  @crm_date = "Jan 24 2017"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end


post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end
