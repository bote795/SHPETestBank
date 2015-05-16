# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
test_list= [
	"Exam 1",
	"Exam 2",
	"Exam 3",
	"Exam 4",
	"Midterm",
	"Final",
	"Other"
]

classes_list=[
	"CSCE 431",
	"CSCE 444"
]

@tests = []
test_list.each do |name|
    @tests.push(Test.create(name: name))
end

@classes = []
classes_list.each do |class_name|
	@classes.push(ClassName.create(name: class_name))
end
