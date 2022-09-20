class CreateInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :institutions do |t|
      t.string :name, index: { unique: true }, null: false # Validating in database too
      t.string :cnpj, index: { unique: true }, null: false # Validating in database too
      t.string :i_type

      t.timestamps
    end
  end
end
