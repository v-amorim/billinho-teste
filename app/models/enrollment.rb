class Enrollment < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :student
  belongs_to :institution
  has_many :bill, dependent: :destroy

  after_create :new_bill

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :quantity_bill, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :course, presence: true

  def bills_amount
    number_with_precision(amount / quantity_bill, precision: 2)
  end

  def new_bill
    month_aux = 1

    due_date = Date.new(Date.today.year, Date.today.month, due_day)

    if due_date <= Date.today
      @private_t_due_date = due_date + 1.months
      month_aux += 1
    else
      @private_t_due_date = due_date
    end

    quantity_bill.times do
      @private_t_due_date = if !Date.valid_date?(Date.today.year, month_aux, due_day)
                              Date.new(Date.today.year, month_aux, -1)
                            else
                              Date.new(Date.today.year, month_aux, due_day)
                            end
      Bill.create(enrollment_id: id, t_amount: bills_amount, t_due_date: @private_t_due_date,
                  t_status: 'Aberta')
      @private_t_due_date = due_date + month_aux.months
      month_aux += 1
    end
  end

  def boolean_to_integer; end
end
