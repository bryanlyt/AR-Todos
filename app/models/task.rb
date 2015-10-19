class Task < ActiveRecord::Base

	validates :name, presence: true  # does not input a nil entry
	validates :name, uniqueness: true  # does not duplicate entry

end

