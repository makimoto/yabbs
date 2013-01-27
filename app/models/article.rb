class Article < ActiveRecord::Base
  default_scope lambda { order('created_at DESC') }
  attr_accessible :body, :name, :title
end
