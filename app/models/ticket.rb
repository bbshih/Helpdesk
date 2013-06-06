class Ticket < ActiveRecord::Base
  has_many :response, autosave: true, :dependent => :delete
  accepts_nested_attributes_for :response
end
