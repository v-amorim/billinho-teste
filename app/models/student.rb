class Student < ApplicationRecord
  has_many :enrollments

  validates :name, presence: true
  validates :cpf, presence: true, numericality: true
  validates :payment_method, presence: true, inclusion: { in: %w[boleto credit_card] }
end
