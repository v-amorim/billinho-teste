class Student < ApplicationRecord
  has_many :enrollments

  validates :name, presence: true
  validates :cpf, presence: true, numericality: true
  validates :gender, presence: true, inclusion: { in: %w[M F] }
  validates :payment, presence: true, inclusion: { in: %w[Boleto Cartao] }
end
