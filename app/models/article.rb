class Article < ActiveRecord::Base
  default_scope lambda { order('created_at DESC') }
  validate :valid_time
  attr_accessible :body, :name, :title, :created_at

  def valid_time
    if created_at.nil?
      errors.add(:created_at, :invalid_format)
    end
  end
end
