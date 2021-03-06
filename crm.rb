require_relative 'contact'

require 'sinatra'



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
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note],
    date:       params[:date]
  )
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end


get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end


put '/contacts/:id' do
 @contact = Contact.find(params[:id].to_i)
if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note],
    date:       params[:date]
    )


    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end


after do
  ActiveRecord::Base.connection.close
end
