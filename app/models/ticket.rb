class Ticket < ActiveRecord::Base
  has_many :responses, autosave: true, :dependent => :delete_all
  accepts_nested_attributes_for :responses
end
