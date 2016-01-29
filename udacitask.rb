require_relative 'todolist.rb'
require 'colorize'

# Creation of the log file (New feature)
$log_file = File.new("report.txt", "w+")


#initialization of parameters in order to avoid harcoded values and allow an automatic
#execution at the begining
nb_tasks_to_create = 4
tasks_to_delete_list = [0,1]
tasks_for_status_update =[0]

def automatic_task_deletion(tasks_to_delete_list,my_todo_list,log_file)
  tasks_to_delete_list.each do |task|
      copy_to_log_file(log_file,"Task deletion",list:my_todo_list.to_do_list,id:task)
      my_todo_list.remove_an_item(task)
      ##tasks_to_delete_list.delete_at(task)
      my_todo_list.print_out_all_items
  end
end

# New feature 1 : log file creation in order to record all the changes in to the list.
# Record any action into a log file
def copy_to_log_file(file,action,options = {})
  if (options[:list] && action =="Task creation")
    file.puts("#{Time.now}  : #{action} #{options[:list].last.description} ")
  end
  if (options[:list] && action =="Task deletion")
    file.puts("#{Time.now}  : #{action} #{options[:list].at(options[:id]).description}")
  end
  if action =="List name update"
    file.puts("#{Time.now}  : #{action}")
  end
end




#def color_selection(level_completion_mana(beg_date, end_date))

#end

#def colorized_console_message(color_selection(level_completion_mana(beg_date, end_date)),task_label)

#end


# Creates a new todo list
my_todo_list = TodoList.new

# Add the number of tasks to create
puts("For initialization, we create #{nb_tasks_to_create} tasks")
nb_tasks_to_create.times do
  my_todo_list.add_an_item
  copy_to_log_file($log_file,"Task creation",{list:my_todo_list.to_do_list})
end

# Print the list
my_todo_list.print_out_all_items

# Remark : the following requirements are covered by the call
#           of the function automatic_task_deletion

# Delete the first item
# Print the list
# Delete the second item
# Print the list
automatic_task_deletion(tasks_to_delete_list,my_todo_list,$log_file)

# Update the completion status of the first item to complete
tasks_for_status_update.each do |task|
  my_todo_list.update_an_item(task)
end

# Print the list
my_todo_list.print_out_all_items

# Update the title of the list
puts("Update of the name of the tasks list in an automatic mode")
my_todo_list.title = "Updated title"
copy_to_log_file($log_file,"List name update")

# Print the list
my_todo_list.print_out_all_items
