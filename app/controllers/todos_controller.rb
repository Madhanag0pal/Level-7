class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_displayable_string
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated todo completed status to #{completed}"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    newTodo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    render plain: "Hey your new todo is created with id  #{newTodo.id}"
  end

  def login
    user = User.find_by(email: params[:email])
    render plain: !!user && user.password == params[:password]
  end
end
