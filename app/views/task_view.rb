require_relative 'config/application'

def display_menu  # display commands of what user can type in
  puts "#" * 50
  puts "Here are your actions:"
  puts "ruby todo.rb list (To list all tasks)"
  puts "ruby todo.rb add TASK (To add task | e.g. ruby todo.rb Finish homework)"
  puts "ruby todo.rb delete NUM_OF_TASK_TO_DELETE (To delete a task | e.g. ruby todo.rb delete 1)"
  puts "ruby todo.rb delete NUM_OF_TASK_TO_DELETE (To complete a task | e.g. ruby todo.rb complete 1)"
end

def display_task_list
  tasks = TaskController.list

  if tasks.empty?
    puts "You have no tasks to be completed."
  else
    tasks.each_with_index { |task, i| puts "#{i}. #{task}"}
  end
end

if ARGV.any?  # returns true if block returns value other than false or nil

  case ARGV[0]  # returns first argument of array
    when "list"
      puts "list"
    when "add"
      puts "add"
    when "delete"
      puts "delete"
    when "complete"
      puts "complete"
    else
      puts "invalid command"
      display_menu
  end

else
  display_menu
end


