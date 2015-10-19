require_relative '../../config/application'
require_relative '../controllers/task_controller.rb'

def display_menu  # display commands of what user can type in
  puts "#" * 50
  puts "Here are your actions:"
  puts "ruby task_view.rb list (To list all tasks)"
  puts "ruby task_view.rb add TASK (To add task | e.g. ruby todo.rb Finish homework)"
  puts "ruby task_view.rb delete TASK_NUMBER (To delete a task | e.g. ruby todo.rb delete 1)"
  puts "ruby task_view.rb complete TASK_NUMBER (To complete a task | e.g. ruby todo.rb complete 1)"
end

def display_tasks_list  # display condition for task list with / without tasks and whether task is completed
  tasks = TasksController.list

  if tasks.empty?
    puts "You have no tasks!"
  else
    tasks.each_with_index do |task, i| 
      completed = task.completed ? 'X' : ' '
      puts "#{i+1}.". + "[#{completed}] #{task.name}"
    end
  end
end

def display_tasks_added(sentence)  
  puts TasksController.add sentence
end

def display_tasks_deleted(task_id)
  puts TasksController.delete task_id.to_i
end

def display_tasks_completed(task_id)
  puts TasksController.complete task_id.to_i
end



def todo_execute
  if ARGV.any?  # returns true if block returns value other than false or nil

    case ARGV[0]  # returns first argument of array
    when "list"
      display_tasks_list
    when "add"
      display_tasks_added ARGV[1..-1].join(' ')
    when "delete"
      display_tasks_deleted ARGV[1]
    when "complete"
      display_tasks_completed ARGV[1]
    else
      puts "invalid command"
      display_menu
    end
  else
    display_menu
  end
end

todo_execute