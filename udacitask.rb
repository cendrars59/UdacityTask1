require_relative 'todolist.rb'

#parameters
nb_tasks_to_create = 4
task_id = 0

# Creates a new todo list
my_todo_list = TodoList.new

# Add four new items
puts("Please create #{nb_tasks_to_create} tasks")
nb_tasks_to_create.times do
  mytask = Item.new(task_id)
  puts("Please enter the task description")
  my_todo_list.add_an_item(mytask)
  task_id = task_id+1
end

# Print the list
my_todo_list.print_out_all_items
puts("Bordel bordel")

# Delete the first item


# Print the list
#my_todo_list.print_out_all_items

# Delete the second item

# Print the list
#my_todo_list.print_out_all_items

# Update the completion status of the first item to complete

# Print the list
#my_todo_list.print_out_all_items

# Update the title of the list

# Print the list
#my_todo_list.print_out_all_items
