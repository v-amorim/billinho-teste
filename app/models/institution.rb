class Institution < ApplicationRecord
    has_many :institutions

    validates :name, presence: true
    validates :cnpj, presence: true, numericality: true, length: { maximum: 14 }
    validates :i_type, inclusion: { in: %w[Universidade Escola Creche] }, presence: true
end
