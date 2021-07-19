class StudentsController < ApplicationController
    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created, include: {studentgoals: {methods: [:goal_title]}}
    end

    private

    def student_params
        params.permit(:name, :grade, :hair_color, :siblings_amount, :teacher_id)
    end
end
