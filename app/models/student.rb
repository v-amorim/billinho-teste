class Student < ApplicationRecord
      # Associations
  has_many :enrollments

  # Validations
  validates :name, presence: true

  validates :cpf, presence: true,
                  numericality: true

  validates :gender, presence: true,
                     inclusion: { in: %w[M F] }

  validates :payment, presence: true,
                      inclusion: { in: %w[Boleto Cartao] }
  # validates :payment, confirmation: { case_sensitive: false}
end
