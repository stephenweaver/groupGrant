class AddCreditCardsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :card_number, :integer
    add_column :payments, :cid, :string
    add_column :payments, :expiration, :string
  end
end
