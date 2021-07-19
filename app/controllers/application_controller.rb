class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'password_that_you_should_change')
      end
    
    
      def auth_header
          # { Authorization: 'Bearer <token>' }
          request.headers['Authorization']
      end
    
      def decoded_token
          if auth_header
              token = auth_header
              begin
                  JWT.decode(token, 'password_that_you_should_change', true, algorithm: 'HS256')
              rescue JWT::DecodeError
                  nil
              end
          end
      end
    
      def current_user
          if decoded_token
              teacher_id = decoded_token[0]['teacher_id']
              @teacher = Teacher.find_by(id: teacher_id)
          end
      end
    
      def logged_in?
          !!current_user
      end
    
      def authorized
        students = Student.all
        render json: { message: 'Please log in' , posts: ActiveModel::Serializer::CollectionSerializer.new(students, each_serializer: StudentSerializer)}, status: :unauthorized unless logged_in?
      end
end
