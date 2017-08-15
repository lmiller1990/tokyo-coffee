class AddDescriptionAndAdditionalDetailsToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :description, :string
    add_column :shops, :additional_details, :string
  end
end
