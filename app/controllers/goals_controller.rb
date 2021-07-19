class GoalsController < ApplicationController

    def create
        new_goal = Goal.create!(goal_params)
        render json: new_goal, status: :created
    end

    private

    def goal_params
        params.permit(:title, :description, :teacher_id, :siblings_amount, :teacher_id)
    end
end
