require 'rails_helper'

RSpec.describe "students index page", type: :feature do
  before(:each) do

    @student_1 = Student.create(name: "Harry Potter",
                                age: 12,
                                house: "Gryffindor")

    @student_2 = Student.create(name: "Ron Weasley",
                                age: 11,
                                house: "Gryffindor")
  end

  it "shows a list of students with name, age, and house" do
    visit '/students'

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.age)
    expect(page).to have_content(@student_1.house)

    expect(page).to have_content(@student_2.name)
    expect(page).to have_content(@student_2.age)
    expect(page).to have_content(@student_2.house)
  end
end
