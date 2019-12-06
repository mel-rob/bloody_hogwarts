# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



@student_1 = Student.create(name: "Harry Potter",
                            age: 12,
                            house: "Gryffindor")

@student_2 = Student.create(name: "Ron Weasley",
                            age: 11,
                            house: "Gryffindor")

@course_1 = Course.create(name: "Defense against the Dark Arts")
@course_2 = Course.create(name: "Herbology")
@course_3 = Course.create(name: "Potions")

@student_course_1 = StudentCourse.create(student_id: @student_1.id, course_id: @course_1.id)
@student_course_2 = StudentCourse.create(student_id: @student_1.id, course_id: @course_2.id)
@student_course_3 = StudentCourse.create(student_id: @student_1.id, course_id: @course_3.id)
