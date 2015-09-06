# Code to refactor
class BadDesign
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def bmi
    data.map {|weight, height| weight / height.to_f ** 2 }
  end
end

# Refactored code
class GoodDesign
  attr_accessor :people
  def initialize(data)
    @people = bmi_fy(data)
  end

  def bmi #(metric[kg,m])
    people.map {|person| person.weight / person.height.to_f ** 2 }
  end
  
  def bmi_en #(English metric[lb,in])
    people.map {|person| person.weight / person.height.to_f ** 2 * 703 }
  end
  
  Person = Struct.new(:weight,:height)
  
  def bmi_fy(data)
      data.map do |weight, height|
         Person.new(weight,height) 
      end
  end
end
stud = BadDesign.new([[71, 1.65], [67, 1.78], [59, 2.10], [78, 2.50]])
students = GoodDesign.new([[71, 1.65], [67, 1.78], [59, 2.10], [78, 2.50]])
#students = [[71, 165], [67, 178], [59, 210], [78, 250]]
p students.bmi 
p stud.bmi
