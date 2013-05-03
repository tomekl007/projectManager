class Project < ActiveRecord::Base
  attr_accessible :description, :name, :users
  has_and_belongs_to_many :users
end
