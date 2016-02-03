########################### Gem import #########################################
require_relative 'todolist.rb'
########################### Initialization #####################################

# Creation of the log file (New feature)
$log_file = File.new("report.txt", "w+")

# Initialization of parameters in order to avoid harcoded values
# and allow an automatic execution at the begining
nb_tasks_to_create = 4
tasks_to_delete_list = [0,1]
tasks_for_status_update =[0]

# Creates a new todo list
my_todo_list = TodoList.new

########################### Main programm ######################################

# Add the number of tasks to create
puts("For initialization, we create #{nb_tasks_to_create} tasks")
nb_tasks_to_create.times do
  my_todo_list.add_an_item
  my_todo_list.copy_to_log_file($log_file,"Task creation",{to_do_list:my_todo_list.to_do_list})
end

# Print the list
my_todo_list.print_out_all_items

# Delete the first item
# Print the list
# Delete the second item
# Print the list
my_todo_list.items_list_deletion(tasks_to_delete_list,$log_file)

# Update the completion status of the first item to complete
tasks_for_status_update.each do |task|
  my_todo_list.update_an_item(task)
end

my_todo_list.print_out_all_items

# Update the title of the list
puts("Update of the name of the tasks list in an automatic mode")
my_todo_list.title = "Updated title"
my_todo_list.copy_to_log_file($log_file,"List name update")

# Print the list
my_todo_list.print_out_all_items

################################################################################
########################### End of file ########################################
