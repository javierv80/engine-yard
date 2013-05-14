class Customer < ActiveRecord::Base
  attr_accessible :department, :name, :number, :phone, :street

  belongs_to :user


  def self.search(params)
  	where("phone LIKE ?", "%#{params[:keyword]}%")
  end
end
