require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  it "can count students in class" do
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

    expect(@course_1.count).to eq(2)
  end
end
