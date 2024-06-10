class CreateEventProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :event_products do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
