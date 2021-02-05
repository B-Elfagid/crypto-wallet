class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    erb :"/sessions/login.html"
  end

  # POST: /sessions
  post "/login" do
    user = User.find_by_email(params["user"]["email"])
    if user && user.authenticate(params["user"]["password"])
      flash[:success] = "Successfully logged in!"
      redirect "/coins"
    else
      flash[:error] = "Invalid credentials"
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
end
