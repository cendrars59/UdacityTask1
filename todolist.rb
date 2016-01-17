class TodoList
    # methods and stuff go here
    attr_accessor :to_do_list, :title
    def initialize
      @to_do_list = []
      @title = "To do list"
    end

    # Method to add a task into the list
    def add_an_item(item)
      @to_do_list << item
    end

    # Method to removre a task from the list
    def remove_an_item(item)
      @to_do_list.delete(item)
    end

    #Print out all the item
    def print_out_all_items
      @to_do_list.each do |item|
        puts(
        item.print_details
        )
      end
    end
end

class Item
    attr_accessor :id,:description,:completion_status,:date
    def initialize(value)
      @id = value
      @description = description
      @completion_status = false
    end

    def update_status

    end

    def print_details
      puts @id
      puts @description
      puts @completion_status
    end

    # methods and stuff go here
end
