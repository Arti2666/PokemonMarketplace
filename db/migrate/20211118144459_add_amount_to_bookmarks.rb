class AddAmountToBookmarks < ActiveRecord::Migration[6.0]
  def change
  add_column :bookings, :amount, :integer
  end
end
