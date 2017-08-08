class AddRegistrationApprovedToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :registration_approved, :bool, null: false, default: false
  end
end
