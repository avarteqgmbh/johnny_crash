class Error < ActiveRecord::Base
  attr_accessible :payload
  
  default_scope order('created_at DESC')
end
