class AddResponsesToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :product_id, :integer
  end
end
