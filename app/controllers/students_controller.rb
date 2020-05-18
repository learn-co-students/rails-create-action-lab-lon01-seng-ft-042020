class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    puts "LOOKIE HERE!\n \n"
    puts params
    @student = Student.create(student_params)
    redirect_to student_path(@student)
  end

  def student_params
    if !params[:student]
      {first_name: params[:first_name], last_name: params[:last_name]}
    else
      params.require(:student).permit(:first_name, :last_name)
    end
  end

end
