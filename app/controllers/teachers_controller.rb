class TeachersController < ApplicationController
    before_action :authorized, only: [:me]

    def login
        teacher = Teacher.find_by(username: params[:username])
        if teacher && teacher.authenticate(params[:password])
            wristband = encode_token(teacher_id: teacher.id)
            render json: {teacher: TeacherSerializer.new(teacher), token: wristband}
        else
          return {error: "Wrong Username or password"}
        end
    end

    def me
        students = Student.all
        wristband = encode_token({teacher_id: @teacher.id})
        render json: {teacher: TeacherSerializer.new(@teacher, token:wristband, students: ActiveModel::Serializer::CollectionSerializer.new(students, each_serializer: StudentSerializer))}
    end

end
