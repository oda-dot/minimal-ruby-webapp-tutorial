require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

enable :method_override
use Rack::MethodOverride

get "/" do
    @title = "Todo 一覧"
    @todos = Todo.order(created_at: :desc)
    erb :index
end

get "/todos/new" do
  @todo = Todo.new
  erb :new
end

post "/todos" do
  @todo = Todo.new(params[:todo])
  if @todo.save
    redirect "/"
  else
    erb :new
  end
end

get "/todos/:id/edit" do
  @todo = Todo.find(params[:id])
  erb :edit
end

patch "/todos/:id" do
  @todo = Todo.find(params[:id])
  if @todo.update(params[:todo])
    redirect "/"
  else
    erb :edit
  end
end

delete "/todos/:id" do
  Todo.find(params[:id]).destroy
  redirect "/"
end