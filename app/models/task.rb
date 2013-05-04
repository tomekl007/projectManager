class Task < ActiveRecord::Base
  attr_accessible :deadline, :name, :project_id, :done
  belongs_to :project

  #TO DO add validation to date

         #   :date => {:after => Time.now, :before => Time.now + 1.year }

end
