class CreateDemoTable < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.text :house_id

    end
  end
end
