require 'sinatra'
require_relative 'todo'

get "/" do
    redirect to ('/home')
end

get "/home" do
    @todos = ToDo.all
    #the @ here means that it is available to the erb file
    p "---------#{@todos}"
end

get "/createToDoForm" do
    erb :createToDoForm
end

get "/ToDoUpdate/:id" do
    @todo= ToDo.find(params[:id])
    erb :updateToDoForm
end

post "/ToDoUpdate/:id" do
    updateToDo = ToDo.find(params[:id])
    updateToDo.task=params[:task]
    updateToDo.deadline=params[:deadline]
    updateToDo.description = params[:description]
    updateToDo.save
    p "#{params}"
end

post "/createToDo" do
    p ">>>>>>>>>> #{params}"
    newToDo = ToDo.new
    newToDo.name= task=params[:task]
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
