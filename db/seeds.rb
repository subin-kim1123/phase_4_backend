# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

salt = BCrypt::Engine::generate_salt

password_digest = BCrypt::Engine::hash_secret('abc123', salt)


puts "Clearing old data"
StudentGoal.destroy_all
Goal.destroy_all
Student.destroy_all
Teacher.destroy_all

puts "Creating teachers"
Teacher.create(name:"Eric", age: 32, subject: "Software Engineering")
Teacher.create(name:"Ix", age: 29, subject: "Javascript")
Teacher.create(name:"Louis", age: 40, subject: "React")
Teacher.create(name:"Dakota", age: 54, subject: "Ruby")

puts "Creating students"
Student.create(name: "Yisrael", grade: 4, teacher: Teacher.first, hair_color: "Blonde", siblings_amount:9)
Student.create(name: "Jason", grade: 4, teacher: Teacher.first, hair_color: "Blonde", siblings_amount: 2)
Student.create(name: "Sue", grade: 9, teacher: Teacher.first, hair_color: "Black", siblings_amount: 4)
Student.create(name: "Paul", grade: 7, teacher: Teacher.first, hair_color: "Black", siblings_amount: 1)
Student.create(name: "Leon", grade: 13, teacher: Teacher.second, hair_color: "Black", siblings_amount: 4)
Student.create(name: "Francisco", grade: 7, teacher: Teacher.second, hair_color: "Black", siblings_amount: 2)
Student.create(name: "Jouqin", grade: 10, teacher: Teacher.second, hair_color: "Red", siblings_amount: 11)
Student.create(name: "Mo", grade: 12, teacher: Teacher.third, hair_color: "Black", siblings_amount: 1)
Student.create(name: "V", grade: 9, teacher: Teacher.third, hair_color: "Pink", siblings_amount: 5)
Student.create(name: "Greg", grade: 5, teacher: Teacher.third, hair_color: "Grey", siblings_amount: 3)
Student.create(name: "Jimmy", grade: 11, teacher: Teacher.fourth, hair_color: "Red", siblings_amount: 6)
Student.create(name: "Jami", grade: 11, teacher: Teacher.fourth, hair_color: "Blonde", siblings_amount: 4)

puts "Creating goals"
Goal.create(title: "Answer a question", description: "Volunteer an answer when a teacher asks a qustion in lecture", teacher: Teacher.first)
Goal.create(title: "Finish 3 labs", description: "Complete 3 labs from the labs that were released today", teacher: Teacher.first)
Goal.create(title: "Take a shower", description: "Make sure to take a shower every day", teacher: Teacher.first)
Goal.create(title: "Don't volunteer anyone", description: "If the teacher asks for a volunteer don't choose somebody else", teacher: Teacher.second)
Goal.create(title: "Blogs", description: "Make sure to have a blog written by blog presentation day", teacher: Teacher.third)
Goal.create(title: "Make a website", description: "Code your own website using an activeRecord backend and React frontend", teacher: Teacher.third)

puts "Creating StudentGoals"
StudentGoal.create(student: Teacher.first.students.first, goal: Teacher.first.goals.first, star: 0 , completed: false, stars_to_complete: 10)
StudentGoal.create(student: Teacher.first.students.first, goal: Teacher.first.goals.second, star: 0 , completed: false, stars_to_complete: 15)
StudentGoal.create(student: Teacher.first.students.first, goal: Teacher.first.goals.third, star: 0 , completed: false, stars_to_complete: 10)

StudentGoal.create(student: Teacher.first.students.second, goal: Teacher.first.goals.third, star: 0, completed: false, stars_to_complete: 12)
StudentGoal.create(student: Teacher.first.students.second, goal: Teacher.first.goals.second, star: 0, completed: false, stars_to_complete: 10)
StudentGoal.create(student: Teacher.first.students.second, goal: Teacher.first.goals.first, star: 0, completed: false, stars_to_complete: 20)

StudentGoal.create(student: Teacher.first.students.third, goal: Teacher.first.goals.first, star: 0, completed: false, stars_to_complete: 15)
StudentGoal.create(student: Teacher.first.students.third, goal: Teacher.first.goals.third, star: 0, completed: false, stars_to_complete: 17)
StudentGoal.create(student: Teacher.first.students.third, goal: Teacher.first.goals.second, star: 0, completed: false, stars_to_complete: 20)

StudentGoal.create(student: Teacher.first.students.fourth, goal: Teacher.first.goals.second, star: 0, completed: false, stars_to_complete: 5)
StudentGoal.create(student: Teacher.first.students.fourth, goal: Teacher.first.goals.first, star: 0, completed: false, stars_to_complete: 10)
StudentGoal.create(student: Teacher.first.students.fourth, goal: Teacher.first.goals.third, star: 0, completed: false, stars_to_complete: 15)

StudentGoal.create(student: Teacher.second.students.first, goal: Teacher.second.goals.first, star: 0, completed: false, stars_to_complete: 20)
StudentGoal.create(student: Teacher.second.students.second, goal: Teacher.second.goals.first, star: 0, completed: false, stars_to_complete: 10)
StudentGoal.create(student: Teacher.second.students.third, goal: Teacher.second.goals.first, star: 0, completed: false, stars_to_complete: 30)

StudentGoal.create(student: Teacher.third.students.first, goal: Teacher.third.goals.first, star: 0 , completed: false, stars_to_complete: 10)
StudentGoal.create(student: Teacher.third.students.first, goal: Teacher.third.goals.second, star: 0 , completed: false, stars_to_complete: 13)

StudentGoal.create(student: Teacher.third.students.second, goal: Teacher.third.goals.first, star: 0, completed: false, stars_to_complete: 15)
StudentGoal.create(student: Teacher.third.students.second, goal: Teacher.third.goals.second, star: 0, completed: false, stars_to_complete: 15)

StudentGoal.create(student: Teacher.third.students.third, goal: Teacher.third.goals.first, star: 0, completed: false, stars_to_complete: 20)
StudentGoal.create(student: Teacher.third.students.third, goal: Teacher.third.goals.second, star: 0, completed: false, stars_to_complete: 12)

puts "All done!"
