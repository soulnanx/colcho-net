class AddConfirmationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmed_at, :datatime

    add_column :users, :confirmation_token, :string

  end
end
