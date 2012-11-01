class PiggybakGiftcertSetup < ActiveRecord::Migration
  def up
    create_table :giftcerts do |t|
      t.string :code, :null => false
      t.decimal :amount, :null => false
      t.date :expiration_date
      t.references :order
      t.timestamps
    end
    create_table :buyable_giftcerts do |t|
    end
    create_table :giftcert_applications do |t|
      t.references :line_item
      t.references :giftcert
      t.timestamps
    end

    gc_vals = [10, 20, 40]

    option = ::PiggybakVariants::Option.new({ :name => "Amount", :position => 1 })
    option.option_configurations << ::PiggybakVariants::OptionConfiguration.new({ :klass => "PiggybakGiftcerts::BuyableGiftcert" })
    gc_vals.each { |val| option.option_values << ::PiggybakVariants::OptionValue.new({ :name => "$#{val}", :position => 1 }) }
    option.save

    bg = ::PiggybakGiftcerts::BuyableGiftcert.new
    gc_vals.each do |val|
      s = ::Piggybak::Sellable.new({ :sku => "giftcert-#{val}", :description => "$#{val} Gift Certificate", :price => val, :active => true, :unlimited_inventory => true }) 
      v = ::PiggybakVariants::Variant.new
      v.piggybak_sellable = s
      v.option_values << ::PiggybakVariants::OptionValue.find_by_name("$#{val}")
      bg.variants << v
    end

    bg.save
  end

  def down
    drop_table :giftcerts
    drop_table :buyable_giftcerts
    drop_table :giftcert_applications

    option = ::PiggybakVariants::Option.find_by_name("Amount")
    ::PiggybakVariants::Option.destroy(option)
  end
end
