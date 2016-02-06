#########################################################################
########################### To do list ##################################

class TodoList

    # methods and stuff go here
    attr_accessor :title, :to_do_list
    def initialize
      @title = "My To do list"
      @to_do_list = []
      @list_completion_status
    end

    # Method to add a task into the list
    def add_an_item
      item = Item.new
      item.description = "Task number #{to_do_list.size+1}"
      to_do_list << item
    end

    # Method to remove a task from the list
    def remove_an_item(code_item_to_delete)
      to_do_list.delete_at(code_item_to_delete)
    end

    # Method to delete several items in once
    def items_list_deletion(tasks_to_delete_list,log_file)
      tasks_to_delete_list.each do |task|
          copy_to_log_file(log_file,"Task deletion",to_do_list:to_do_list,id:task)
          remove_an_item(task)
          print_out_all_items
      end
    end

    # New feature 1 : log file creation in order to record all the changes in to the list.
    # Record any action into a log file
    def copy_to_log_file(file,action,options = {})
      if (options[:to_do_list] && action =="Task creation")
        file.puts("#{Time.now}  : #{action} #{options[:to_do_list].last.description} ")
      end
      if (options[:to_do_list] && action =="Task deletion")
        file.puts("#{Time.now}  : #{action} #{options[:to_do_list].at(options[:id]).description}")
      end
      if action =="List name update"
        file.puts("#{Time.now}  : #{action}")
      end
    end

    # Method to update the completion status of a task into the list
    def update_an_item(position)
      to_do_list.at(position).update_status
    end

    # Display the to do list title
    def list_header(title)
      2.times do
        puts ("")
      end
      puts ("Details of your todo list #{title}")
      puts ("")
    end

    #Print out all the item
    def print_out_all_items
      list_header(title)
      to_do_list.each do |item|
        item.print_details
      end
      puts ("Task list completed #{to_do_list_completed?}")
    end

    #New feature 3 if all the tasks of the list are completed then
    #the task list is completed
    def to_do_list_completed?
      return @to_do_list.all? {|item| item.completion_status == true}
    end


end

#########################################################################
########################### Item ########################################

class Item
    attr_accessor :description
    attr_reader :completion_status
    def initialize
      @description = description
      @beg_date = Time.now
      @end_date = Time.now + (24*60 *60)
      @completion_status = false
      @completion_level = level_completion_mana(@beg_date,@end_date)
      @owner = ""
    end

    def update_status
      @completion_status = !@completion_status
    end

    def print_details
      puts ("------------------------------------------------------------------------------")
      puts ("|#{@description}     end date  :#{@end_date} |#{completion_status_management} | level of completion #{level_completion_mana(@beg_date,@end_date)} %")
      puts ("------------------------------------------------------------------------------")
    end

    def completion_status_management
      if @completion_status == false
        return "[ ]"
      else
        return "[X]"
      end
    end

    # New feature 2 : the level of completion management
    def level_completion_mana(beg_date,end_date)
      return ((Time.now - beg_date)/(end_date - beg_date)*100).round(2)
    end

end

################################################################################
########################### End of file ########################################
