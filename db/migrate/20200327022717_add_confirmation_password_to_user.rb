class AddConfirmationPasswordToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmation_password, :string
  end
end
