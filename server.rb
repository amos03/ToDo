require 'sinatra'
require_relative 'todo'

get "/" do
    redirect to ('/home')
end

get "/home" do
    @todos = ToDo.all
     erb :home
end

get "/createToDoForm" do
    erb :createToDoForm
end

get "/updateToDo/:id" do
    @todo= ToDo.find(params[:id])
    erb :updateToDoForm
end

post "/updateToDo/:id" do
    updateToDo = ToDo.find(params[:id])
    updateToDo.task=params[:task]
    updateToDo.deadline=params[:deadline]
    updateToDo.description = params[:description]
    updateToDo.save
    redirect to('/home')
 end

post "/createToDo" do
    p ">>>>>>>>>> #{params}"
    newToDo = ToDo.new
    newToDo.task=params[:task]
    newToDo.deadline=params[:deadline]
    newToDo.description=params[:description]
    newToDo.save
    #params is middle-man between client and server
    #it's a hash that will contain data sent to client 
    redirect to("/home")
end

get "/deleteToDo/:id" do
todo=ToDo.find(params[:id])
todo.delete
redirect to("/home")
end
