class StudentGoal < ApplicationRecord
  belongs_to :student
  belongs_to :goal

  def goal_title
    self.goal.title
  end

  def self.addStar(id)
    studentgoal=self.all.find(id)
    if studentgoal.star == studentgoal.stars_to_complete - 1 && studentgoal.completed == false
      studentgoal.update(star: studentgoal.star + 1, completed: true)
    elsif studentgoal.completed == false
      studentgoal.update(star: studentgoal.star+1)
    end
    studentgoal
  end
end
