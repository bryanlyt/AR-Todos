class TasksController < ActiveRecord::Base

	def self.list
		Task.all
	end

	def self.add(sentence)
		Task.create(name: sentence)
		task.valid? ? "Appended #{sentence} to your TODO list..." : "Error: try again."
	end

  	def self.delete(task_id)  # represents id on the list where the task is
	    task = find_task task_id
	   	if task
    		task = task.destroy
	 	  	task.valid? ? "Deleted '#{task.name}' from your TODO list..." : "Error: try again."
    	else
      		"Error: invalid task ID provided."
    	end
  	end

  	def self.complete(task_id)  
	    task = find_task task_id
	    if task
	      update_result = task.update_attributes completed: true
	      update_result ? "Completed '#{task.name}' from your TODO list..." : "Error: try again."
	    else
	      "Error: invalid task ID provided."
	    end
	end

	def self.find_task(task_id)
	    tasks = Task.all
	    (task_id > tasks.count or task_id < 1) ? nil : tasks[task_id - 1]
	end

end
