class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, index: { unique: true }, null: false
      t.string :cpf, index: { unique: true }, null: false
      t.date :birthday
      t.string :payment_method, null: false

      t.timestamps
    end
  end
end
