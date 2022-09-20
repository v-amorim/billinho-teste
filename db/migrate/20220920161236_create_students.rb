class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, index: { unique: true }, null: false
      t.string :cpf, index: { unique: true }, null: false
      t.date :birth
      t.string :tell
      t.string :gender, null: false
      t.string :payment, null: false

      t.timestamps
    end
  end
end
