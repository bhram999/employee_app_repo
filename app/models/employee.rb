class Employee < ActiveRecord::Base
  belongs_to :department

  scope :order_by_age, -> {order('age ASC')}
  scope :order_by_dep, -> {order('department_name ASC')}
  scope :order_by_salary, -> {order('salary ASC')}
  scope :retired, -> {where("age >= 65")}
  scope :high_sal, -> {where("salary = #{maximum("salary")}")}
  scope :top5_sal, -> {order('salary DESC').first(5)}
  scope :senior5, -> {where("age < 65").order('age DESC').first(5)}
  scope :low_sal, -> {where("salary = #{minimum("salary")}")}
  scope :low_senior, -> {where("age > 60 && age < 65").order("salary ASC").first(1)}
  scope :max_sal, -> {select("id","name", "age", "email", "max(salary) as salary", "department_id").group("department_id")}

end
