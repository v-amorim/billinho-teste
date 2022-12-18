class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :amount, presence: true
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[open pending paid] }
end
