class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :job
      t.integer :pay

      t.timestamps
    end
  end
end
