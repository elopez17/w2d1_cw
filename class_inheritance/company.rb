class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    @employees = []
    super
  end
  
  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
    end
    sum * multiplier
  end
  
  def add_employee(employee)
    @employees.push(employee)
  end
end

if __FILE__ == $0
  ned = Manager.new("Ned", "Founder", 100, nil)
  darren = Employee.new("Darren", "TA", 78, "Ned")
  shawna = Employee.new("Shawna", "TA", 12, "Ned")
  ned.add_employee(darren)
  ned.add_employee(shawna)
  p darren.bonus(4)
  p ned.bonus(5)
end 