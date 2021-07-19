class Teacher < ApplicationRecord
    has_many :students
    has_many :goals
    has_secure_password
end
