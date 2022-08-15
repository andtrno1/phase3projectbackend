class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/user" do
    
    User.all.to_json

  end

  get "/user/:id" do
    showuser = User.find_by(id: params[:id])
    showuser.to_json(include :comments)
  end

  post "/user" do
    createusers = User.create(
     username: params[:username],
     email: params[:email],
     password: params[:password]
    )
    createusers.to_json
 end


  delete"/user/email" do
    deleteuser = User.find(params[:email])
    deleteuser.destroy
    deleteuser.to_json
  end

  

  

end