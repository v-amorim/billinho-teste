class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.float :amount, null: false
      t.integer :quantity_bill, null: false
      t.integer :due_day, null: false
      t.string :course, null: false

      t.timestamps
    end
  end
end
