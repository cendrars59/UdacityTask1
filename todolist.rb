class TodoList
    # methods and stuff go here
    attr_accessor :title, :to_do_list
    def initialize
      @title = "My To do list"
      @to_do_list = []
    end

    # Method to add a task into the list
    def add_an_item
      item = Item.new
      item.description = "Task number #{to_do_list.size}"
      to_do_list << item
    end

    # Method to remove a task from the list
    def remove_an_item(code_item_to_delete)
      to_do_list.delete_at(code_item_to_delete)
    end

    # Method to update the completion status of a task into the list
    def update_an_item(position)
      to_do_list.at(position).update_status
    end

    def list_header(title)
      puts ("")
      puts ("")
      puts ("Details of your todo list #{title}")
      puts ("")
      puts ("|Task Description                                          |Completed")
    end

    #Print out all the item
    def print_out_all_items
      list_header(title)
      to_do_list.each do |item|
        item.print_details
      end
    end
end

class Item
    attr_accessor :description, :completion_status
    def initialize
      @description = description
      @completion_status = false
    end

    def update_status
      @completion_status = !@completion_status
    end

    def print_details
      puts ("------------------------------------------------------------------------------")
      puts ("|#{@description}                                             |#{completion_status_management}")
      puts ("------------------------------------------------------------------------------")
    end

    def completion_status_management
      if @completion_status == false
        return "[ ]"
      else
        return "[X]"
      end
    end
end
