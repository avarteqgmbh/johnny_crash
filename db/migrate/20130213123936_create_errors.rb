class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.text :payload
      t.timestamps
    end
  end
end
