# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
include Faker

50.times do
			Employee.create(:name => "#{Name.first_name}",
							:email => "#{Internet.email}",
							:age => rand(20..80),
							:salary => rand(40000..65000),
							:department_id => rand(1..5)
							)
		end

Department.create(department_name: 'Health', created_at: '2016-06-15 22:04:29',updated_at: '2016-06-15 22:04:29')
Department.create(department_name: 'Beauty', created_at: '2016-06-15 22:04:29',updated_at: '2016-06-15 22:04:29')
Department.create(department_name: 'Accounts', created_at: '2016-06-15 22:04:29',updated_at: '2016-06-15 22:04:29')
Department.create(department_name: 'Recruitment', created_at: '2016-06-15 22:04:29',updated_at: '2016-06-15 22:04:29')
Department.create(department_name: 'Management', created_at: '2016-06-15 22:04:29',updated_at: '2016-06-15 22:04:29')
