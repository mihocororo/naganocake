class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

    t.integer :customer_id
    t.string :name
    t.string :postal_code
    t.string :address
    t.integer :postage
    t.integer :payment_price
    t.integer :pay_method, null:false, default:0
    t.integer :order_status, null:false, default:0


      t.timestamps
    end
  end
end
