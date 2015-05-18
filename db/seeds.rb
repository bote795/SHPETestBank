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
email_list=[
	"shpe@jason.com",
	"erick@gmail.com",
	"jason@yahoo.com"
]
@tests = []
test_list.each do |name|
    @tests.push(ClassTestName.create(name: name))
end

@classes = []
classes_list.each do |class_name|
	@classes.push(ClassName.create(name: class_name))
end
email_list.each do |email|
    MemberEmail.create(email: email)
end
#TestEntry.create(:link )
(0..5).each do |i| 
  ticket = TestEntry.create(link: 'www.google.com', semester: 'Fall 2015', teacher: "Bush",
   className_id: @classes[rand(2)].id, 
   classTestName_id: @tests[rand(6)].id)
end

user = User.create(email: 'name@admin.com', password: 'password1', password_confirmation: 'password1')
user = User.create(email: 'name@user.com', password: 'password1', password_confirmation: 'password1')


