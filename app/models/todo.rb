class Todo < ApplicationRecord
  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
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
end
