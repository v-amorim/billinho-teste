class Institution < ApplicationRecord
  validates :name, :cnpj, :kind, presence: true

  enum kind: {
    university: 'university',
    school: 'school',
    nursery: 'nursery'
  }
end
