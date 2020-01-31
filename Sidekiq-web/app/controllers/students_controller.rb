class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(params_student)
        @student.save
    end

    private def params_student
        params.require(:student).permit(:rollno,:name,:address,:marks)
    end 

    def import
        if (params[:file] == nil)
            redirect_to students_path, notice:"Give file name"
        else
            @file_params = params[:file].path
            FirstWorker.perform_async @file_params
            redirect_to students_path, notice:"Successful import"
        end
    end
end
