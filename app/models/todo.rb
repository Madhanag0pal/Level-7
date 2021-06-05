class Todo < ApplicationRecord
  def due_today?
    due_date == Date.today
  end

  def self.add_task(h)
    Todo.create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed(status = true)
    all.where(completed: status)
  end

  def self.mark_as_complete!(id)
    todo = find(id)
    todo.completed = !todo.completed
    todo.save!
    todo
  end
end
