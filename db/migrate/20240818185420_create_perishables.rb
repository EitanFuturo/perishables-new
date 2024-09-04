class CreatePerishables < ActiveRecord::Migration[7.2]
  def change
    create_table :perishables do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
