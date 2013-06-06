class RemoveProductFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :product_id
    add_column :responses, :ticket_id, :integer
  end
end
