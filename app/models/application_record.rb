class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.per_page = 10

  def size
    super
    rescue NoMethodError
  end
end
