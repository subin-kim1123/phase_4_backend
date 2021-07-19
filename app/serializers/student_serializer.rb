class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :grade, :hair_color, :sibling_amount
  has_one :teacher
end
