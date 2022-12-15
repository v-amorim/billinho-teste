class Api::V1::EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show update destroy ]

  # GET /enrollments
  def index
    @enrollments = Enrollment.all

    render json: @enrollments
  end

  # GET /enrollments/1
  def show
    render json: @enrollment
  end

  # POST /enrollments
  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      render json: @enrollment, status: :created, location: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enrollments/1
  def update
    if @enrollment.update(enrollment_params)
      render json: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enrollments/1
  def destroy
    @enrollment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:student_id, :institution_id, :amount, :installments, :due_day, :course)
    end
end
