class TodosController < ApplicationController
  def index
  end

  def show
    todo = Todo.find(params[:id])
    render plain: todo
  end

  def update
    Todo.update(params[:id], completed: params[:completed])
    render plain: "Updated todo completed status to #{params[:completed]}"
  end

  def create
    newTodo = Todo.create!(
      todo_text: params[:todo_text],
      due_date: DateTime.parse(params[:due_date]),
      completed: false,
    )
    render plain: "Hey your new todo is created with id  #{newTodo.id}"
  end

  def login
    user = User.find_by(email: params[:email])
    render plain: !!user && user.password == params[:password]
  end
end
