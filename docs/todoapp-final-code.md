# todoapp 完成コードリファレンス

学習ステップを終えた後に、自己実装と見比べるための完全版コードです。

---

## ディレクトリ構成
```text
todo_app/
├── app.rb
├── config.ru
├── Gemfile
├── config/
│   └── database.yml
├── db/
│   └── development.sqlite3  # 実行後に生成
├── models/
│   └── todo.rb
└── views/
    ├── index.erb
    ├── new.erb
    └── edit.erb
```

---

## Gemfile
```ruby
source "https://rubygems.org"

gem "sinatra"
# 自動リロード等を含む便利機能
gem "sinatra-contrib"
# ActiveRecord + SQLite
gem "sinatra-activerecord"
gem "sqlite3"
```

---

## config/database.yml
```yaml
development:
  adapter: sqlite3
  database: db/development.sqlite3
```

---

## config.ru
```ruby
require_relative './app'
run Sinatra::Application
```

---

## Rakefile
```ruby
require 'sinatra/activerecord/rake'
```

---

## app.rb
```ruby
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?
require_relative 'models/todo'

# Rack::MethodOverride で PATCH/DELETE を使う
enable :method_override
use Rack::MethodOverride

# 一覧
get '/' do
  @todos = Todo.order(created_at: :desc)
  erb :index
end

# 新規フォーム
get '/todos/new' do
  @todo = Todo.new
  erb :new
end

# 作成
post '/todos' do
  @todo = Todo.new(params[:todo])
  if @todo.save
    redirect '/'
  else
    erb :new
  end
end

# 編集フォーム
get '/todos/:id/edit' do
  @todo = Todo.find(params[:id])
  erb :edit
end

# 更新
patch '/todos/:id' do
  @todo = Todo.find(params[:id])
  if @todo.update(params[:todo])
    redirect '/'
  else
    erb :edit
  end
end

# 削除
delete '/todos/:id' do
  Todo.find(params[:id]).destroy
  redirect '/'
end
```

---

## models/todo.rb
```ruby
class Todo < ActiveRecord::Base
  validates :title, presence: true
end
```

---

## views/index.erb
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Todo List</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body class="p-4">
  <h1>Todos</h1>
  <a href="/todos/new" class="btn btn-primary mb-3">New</a>
  <table class="table">
    <% @todos.each do |todo| %>
      <tr>
        <td><%= todo.title %></td>
        <td><%= todo.done ? "✅" : "❌" %></td>
        <td>
          <a href="/todos/<%= todo.id %>/edit" class="btn btn-sm btn-secondary">Edit</a>
          <form action="/todos/<%= todo.id %>" method="post" style="display:inline;">
            <input type="hidden" name="_method" value="delete" />
            <button class="btn btn-sm btn-danger">Delete</button>
          </form>
        </td>
      </tr>
    <% end %>
  </table>
</body>
</html>
```

---

## views/new.erb
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>New Todo</title>
</head>
<body class="p-4">
  <h1>New Todo</h1>
  <form action="/todos" method="post">
    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" class="form-control" name="todo[title]" />
    </div>
    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea class="form-control" name="todo[description]"></textarea>
    </div>
    <button class="btn btn-primary">Create</button>
  </form>
</body>
</html>
```

---

## views/edit.erb
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Edit Todo</title>
</head>
<body class="p-4">
  <h1>Edit Todo</h1>
  <form action="/todos/<%= @todo.id %>" method="post">
    <input type="hidden" name="_method" value="patch" />
    <div class="mb-3">
      <label class="form-label">Title</label>
      <input type="text" class="form-control" name="todo[title]" value="<%= @todo.title %>" />
    </div>
    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea class="form-control" name="todo[description]"><%= @todo.description %></textarea>
    </div>
    <div class="form-check mb-3">
      <input class="form-check-input" type="checkbox" name="todo[done]" <%= "checked" if @todo.done %> />
      <label class="form-check-label">Done</label>
    </div>
    <button class="btn btn-primary">Update</button>
  </form>
</body>
</html>
```

---

> **使い方**: ご自身の実装が動かない場合、差分を比較して原因を特定してください。 