class Institution < ApplicationRecord
    # Associations
    has_many :institutions

    # Validations
    validates :name, presence: true

    validates :cnpj, presence: true,
                    numericality: true,
                    length: { maximum: 14 }

    validates :i_type, inclusion: { in: %w[Universidade Escola Creche] },
                        presence: true # The document don't require this validation
end
