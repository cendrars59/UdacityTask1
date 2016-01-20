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

# Add the number of tasks to create
puts("Please create #{nb_tasks_to_create} tasks")
nb_tasks_to_create.times do
  mytask = Item.new(task_id)
  mytask.description = "Task number#{task_id}"
  my_todo_list.add_an_item(mytask)
  task_id = task_id+1
end

# Print the list
my_todo_list.print_out_all_items

# Remark : the following requirements are covered by the call
#           of the function automatic_task_deletion
# Delete the first item
# Print the list
# Delete the second item
# Print the list
automatic_task_deletion(tasks_to_delete_list,my_todo_list)

# Update the completion status of the first item to complete


# Print the list
my_todo_list.print_out_all_items

# Update the title of the list
puts("Update of the name of the tasks list in an automatic mode")
my_todo_list.title = "Updated title"

# Print the list
my_todo_list.print_out_all_items
