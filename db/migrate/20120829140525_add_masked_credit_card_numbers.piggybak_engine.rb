# This migration comes from piggybak_engine (originally 20120716191225)
class AddMaskedCreditCardNumbers < ActiveRecord::Migration
  def up
    add_column :payments, :masked_number, :string, :nil => false
  end

  def down
    remove_column :payments, :masked_number
  end
end
