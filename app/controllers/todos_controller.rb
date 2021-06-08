class TodosController < ApplicationController
  def index
  end

  def show
    todo = Todo.find(params[:id])
    render plain: todo
  end

  def update
    Todo.update(params[:id], completed: params[:completed])
    redirect_to todos_path
  end

  def create
    Todo.create!(
      todo_text: params[:todo_text],
      due_date: DateTime.parse(params[:due_date]),
      completed: false,
    )
    redirect_to todos_path
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end

  def login
    user = User.find_by(email: params[:email], password: params[:password])
    render plain: !!user # returns false if user is nil
  end
end
