class UsersController < ApplicationController

  def new
    @user = User.new
  end
  # /users/new

  get '/users/new' do
    erb :new
  end

  post '/users' do
    @user = Users.create(params)
    redirect "/users/#{@user.id}"
  end
  # create

  get '/users' do
    @users = User.all
    erb :index
  end
  # index

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :show
  end
  # show

  get '/users/:id/edit' do
    @user = User.find_by(id: params[:id])
    erb :edit
  end
  # edit

  patch '/users/:id' do
    user = User.find_by(id: params[:id])
    user.name = params[:name]
    user.hometown = params[:hometown]
    user.save
    redirect "/users/#{user.id}"
  end
  # update

  delete '/users/:id/delete' do
    user = User.find_by(id: params[:id])
    user.destroy
    redirect '/users'
  end
  # destroy

end


# Write the controller action as if this was a rails controller
# Write the url that sends a user to the action. I have done the first one for you.
