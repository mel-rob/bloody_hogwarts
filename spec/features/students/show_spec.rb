require 'rails_helper'

RSpec.describe "students show page", type: :feature do
  before(:each) do

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
  end

  it "shows the list of that student's courses" do

  visit "/students/#{@student_1.id}"

  expect(page).to have_content(@course_1.name)
  expect(page).to have_content(@course_2.name)
  expect(page).to have_content(@course_3.name)
  end
end
