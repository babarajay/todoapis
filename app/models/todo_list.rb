class TodoList < ApplicationRecord
  belongs_to :user
  has_many :todo_list_items

  validates(
    :title,
    presence: true
  )

  validates_length_of(
    :title,
    maximum: 120,
    allow_blank: true
  )

  validates_length_of(
    :description,
    maximum: 160,
    allow_blank: true
  )

  def update_completed
    puts "===todo ;oist=="
    uncompleted_items = todo_list_items.select { |e| !e.completed? }
    update(completed: true) if uncompleted_items.zero?
  end
end
