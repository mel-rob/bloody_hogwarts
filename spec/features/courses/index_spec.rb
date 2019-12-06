require 'rails_helper'

RSpec.describe "courses index page", type: :feature do
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

    @student_course_4 = StudentCourse.create(student_id: @student_2.id, course_id: @course_1.id)
    @student_course_5 = StudentCourse.create(student_id: @student_2.id, course_id: @course_2.id)
  end

  it "shows a list of courses with number of students enrolled" do
    visit '/courses'

    expect(page).to have_content("Defense against the Dark Arts: 2")
    expect(page).to have_content("Herbology: 2")
    expect(page).to have_content("Potions: 1")
  end
end
