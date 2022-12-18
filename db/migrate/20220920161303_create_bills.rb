class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.decimal :amount, null: false
      t.date :due_date, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
