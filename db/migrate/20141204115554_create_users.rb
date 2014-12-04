class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.integer :followers

      t.timestamps null: false
    end
  end
end
