class StudentGoalSerializer < ActiveModel::Serializer
  attributes :id, :star, :completed
  has_one :student
  has_one :goal
end
