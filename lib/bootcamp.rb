class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students  = []
    @grades = Hash.new { |k, v|  k[v] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(str_teacher)
    @teachers << str_teacher
  end

  def enroll(str_stud)
    if @students.length < @student_capacity
        @students << str_stud
        return true
    else
        return false
    end
  end

  def enrolled?(str_stud)
    return true if @students.include?(str_stud)
    false
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(str_stud, num)
    if enrolled?(str_stud)
      @grades[str_stud] << num
      return true
    end
    false
  end

  def num_grades(str_stud)
    @grades[str_stud].length
  end

  def average_grade(str_stud)
    if num_grades(str_stud) == 0 || !enrolled?(str_stud)
        return nil
    end
    @grades[str_stud].sum / num_grades(str_stud)
end

end
