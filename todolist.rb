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
    end
end

class Item
    attr_accessor :description, :completion_status, :beg_date, :end_date,
    :completion_status, :owner

    def initialize
      @description = description
      @beg_date = Time.now
      @end_date = Time.now + (24*60 *60)
      @completion_status = false
      @completion_level = level_completion_mana(@beg_date,@end_date)
      @owner = "Not allocated"
    end

    def update_status
      @completion_status = !@completion_status
    end

    def print_details
      puts ("------------------------------------------------------------------------------")
      puts ("|#{@description}     end date  :#{@end_date} |#{completion_status_management} | level of completion #{level_completion_mana(@beg_date,@end_date)} % | owner : #{@owner}")
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
