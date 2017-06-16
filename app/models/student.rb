class Student < ActiveRecord::Base
  def show_grade
      if grade >= 90
        "S級(#{grade})"
      elsif grade > 80  && grade < 90
        "A級(#{grade})"
      elsif grade > 70  && grade < 80
        "B級(#{grade})"
      elsif grade > 60  && grade < 70
        "C級(#{grade})"
      else
        "D級(#{grade})"
      end
      
  end
end
