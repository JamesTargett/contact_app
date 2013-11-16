require "sinatra"
require "sinatra/activerecord"

require_relative "database"
require_relative "application"
require_relative "contact"

# Get all of our routes
get "/" do
  @contacts = Contact.all
  erb :"contacts/index"
end
 
# Get the New Post form
get "/contacts/new" do
  @title = "New Contact"
  @contact = Contact.new
  erb :"contacts/new"
end
 
# The New Post form sends a POST request (storing data) here
# where we try to create the post it sent in its params hash.
# If successful, redirect to that post. Otherwise, render the "posts/new"
# template where the @post object will have the incomplete data that the 
# user can modify and resubmit.
post "/contacts" do
  @contact = Contact.new(params[:contact])
  if @contact.save
    redirect "contacts/#{@contact.id}"
  else
    erb :"contact/new"
  end
end
 
# Get the individual page of the post with this ID.
get "/contacts/:id" do
  @contact = Contact.find(params[:id])
# REMOVED - DEBUGGING  @title = @contact.title
  erb :"contacts/show"
end
 
# Get the Edit Post form of the post with this ID.
get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id])
# REMOVED - DEBUGGING  @title = "Edit Form"
  erb :"contacts/edit"
end
 
# The Edit Post form sends a PUT request (modifying data) here.
# If the post is updated successfully, redirect to it. Otherwise,
# render the edit form again with the failed @post object still in memory
# so they can retry.
put "/contacts/:id" do
  @contact = Contact.find(params[:id])
  if @contact.update_attributes(params[:post])
    redirect "/contacts/#{@post.id}"
  else
    erb :"contacts/edit"
  end
end
 
# Deletes the post with this ID and redirects to homepage.
get "/contacts/:id/delete" do
  @contact = Contact.find(params[:id]).destroy
  redirect "/"
end
 
# Our About Me page.
get "/about" do
# REMOVED - DEBUGGING  @title = "About Me"
  erb :"pages/about"
end