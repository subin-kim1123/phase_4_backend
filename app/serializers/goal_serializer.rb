class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :teacher
end
