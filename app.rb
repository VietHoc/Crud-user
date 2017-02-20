 #** Config **#
require 'bundler'
Bundler.require()


#** COnnection **
ActiveRecord::Base.establish_connection({
		:adapter => 'postgresql',
		:database => 'crud_users' 
	})

##**Model **
require './models/user'

#** Routes**
get '/' do
	'hoc'
end

# -READ ALL: index -
get '/users' do
	@users = User.all
	erb :'users/index'
end


#- FORM for CREATING: new -
get '/users/new' do
	erb :'users/new'
end
#- CREATE NEW User:create -
post '/users' do
	user = User.create(params[:user])
	redirect "/users/#{ user.id }"
end


# -READ INDIVIDUAL: show -
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'users/show'
end


# -FROM for UPDATING: edit -
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'users/edit'
end

# -UPDATE USER: update -
put '/users/:id' do
	user = User.find(params[:id])
	User.update(params[:user])
	redirect "/users/#{ user.id }"
end



# -DESTROY USER: destroy -
delete '/users/:id' do
	User.delete(params[:id])
	redirect '/users'
end

#search
post '/search' do
	@title = "Search results"
	@user = User.search(params[:search]).all
	if @user.nil?
		"No user found !"
	else
		erb :'users/show'
	end
end