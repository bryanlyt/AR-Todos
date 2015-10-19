require_relative "../../config/application"

class CreateTasks < ActiveRecord::Migration

	def change
		create_table :tasks do |t|
			t.string :name
			t.boolean :completed, default: :false
    	end
  	end
end