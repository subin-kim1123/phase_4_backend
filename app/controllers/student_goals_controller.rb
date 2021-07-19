class StudentGoalsController < ApplicationController
    before_action :authorized, only: [:create, :destory]

    def create
        new_student_goal = StudentGoal.create!(studentGoal_params)
        render json: new_student_goal, status: :created
    end

    def destroy
        new_student_goal = StudentGoal.find(params[:id])
        student_goal.destroy
        render json: new_student_goal, status: :deleted
    end

    def update
        new_student_goal = StudentGoal.find(params[:id])
        student_goal.update(studentGoal_params)
        render json: new_student_goal.addStar
    end

    private

    def studentGoal_params
        params.permit(:student_id, :goal_id, :star, :completed, :stars_to_complete)
    end
    
end
