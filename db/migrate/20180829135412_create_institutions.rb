class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name, null: false, unique: true
      t.string :cnpj, null: false, unique: true
      t.string :kind, null: false
    end
  end
end
