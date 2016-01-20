require_relative 'todolist.rb'

#initiaze parameters
nb_tasks_to_create = 4
task_id = 0
tasks_to_delete_list = [0,1]

# Creates a new todo list
my_todo_list = TodoList.new

def automatic_task_deletion(tasks_to_delete_list,my_todo_list)
  tasks_to_delete_list.each do |task|
      my_todo_list.remove_an_item(task)
      my_todo_list.print_out_all_items
  end
end

# Add four new items
puts("Please create #{nb_tasks_to_create} tasks")
nb_tasks_to_create.times do
  mytask = Item.new(task_id)
  mytask.description = "Task number#{task_id}"
  my_todo_list.add_an_item(mytask)
  task_id = task_id+1
end

# Print the list
my_todo_list.print_out_all_items

# Delete the first item
#my_todo_list.remove_an_item(0)

# Print the list
#my_todo_list.print_out_all_items


# Delete the second item
#my_todo_list.remove_an_item(1)

# Print the list
#my_todo_list.print_out_all_items


automatic_task_deletion(tasks_to_delete_list,my_todo_list)


puts("Putain bordel Putain bordel")

# Update the completion status of the first item to complete

# Print the list
#my_todo_list.print_out_all_items

# Update the title of the list

# Print the list
#my_todo_list.print_out_all_items
