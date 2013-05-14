class Product < ActiveRecord::Base
  attr_accessible :name, :price

  belongs_to :user
end
