module StudentsHelper 
  def a_grade(student)
      if student.grade.to_i >= 90
        "S級(#{student.grade})"
      elsif student.grade >= 80 && student.grade < 90
        "A級(#{student.grade})"
     
      elsif student.grade >= 70 && student.grade < 80
        "B級(#{student.grade})"
     
      elsif student.grade >= 60 && student.grade < 70
        "C級(#{student.grade})"

      else
        "D級(#{student.grade})"
      end
      
  end
end

