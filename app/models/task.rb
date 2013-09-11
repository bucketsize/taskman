class Task < ActiveRecord::Base
  belongs_to :user
  has_many :children, :class_name => 'Task', :foreign_key => :parent_id, :dependent => :destroy
  belongs_to :parent, :class_name => 'Task', :foreign_key => :parent_id
end
