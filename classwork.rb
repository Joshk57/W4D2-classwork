
class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

        if !boss.nil?
            boss.employees << self
        end
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end


class Manager < Employee
    public
    attr_accessor :employees

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss = nil)
        @employees = []
    end


    

    def bonus(multiplier)
        sum_salary = 0

        @employees.each do |employee|
            sum_salary += employee.salary
            # if !employee.employees.
            if !employee.instance_variable_defined?(@employees)
                sum_salary += employee.bonus(1)
            end
        end

   



        bonus = sum_salary * multiplier

    end
end


ned = Manager.new("ned", "manager", 1_000_000)
darren = Manager.new("darren", "TA Manager", 78_000, ned)
shawna = Employee.new("shawn", "TA", 12_000, darren)
david = Employee.new("david", "TA", 10_000, darren)


p ned
p ned.bonus(5) # => 500_000

p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
