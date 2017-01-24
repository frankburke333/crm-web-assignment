

require 'sinatra'

get '/' do
  @crm_app_name = "Bitmaker's CRM"
  erb :index
end
