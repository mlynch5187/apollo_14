require 'rails_helper'

RSpec.describe "Astronauts index", type: :feature do
  before(:each) do
    @astronaut1 = Astronaut.create(name: "Alex", age: 33, job: "Astronaut")
    @astronaut2 = Astronaut.create(name: "Mike", age: 72, job: "Technician")
    @astronaut3 = Astronaut.create(name: "John", age: 46, job: "Astronaut")
    @mission1 = @astronaut1.missions.create(title: "Galaxy Sweep", time_in_space: 72)
    @mission2 = @astronaut2.missions.create(title: "Starbound", time_in_space: 144)
  end

  it "Shows a list of astronauts with name, age, and job" do
    visit "/astronauts"

    expect(page).to have_content(@astronaut1.name)
    expect(page).to have_content(@astronaut1.age)
    expect(page).to have_content(@astronaut1.job)
    expect(page).to have_content(@astronaut2.name)
    expect(page).to have_content(@astronaut2.age)
    expect(page).to have_content(@astronaut2.job)
    expect(page).to have_content(@astronaut3.name)
    expect(page).to have_content(@astronaut3.age)
    expect(page).to have_content(@astronaut3.job)
    expect(page).to have_content("Name: Alex, Age: 33, Job: Astronaut")
    expect(page).to have_content("Name: Mike, Age: 72, Job: Technician")
    expect(page).to have_content("Name: John, Age: 46, Job: Astronaut")
  end

  it "Shows average age of astronauts" do
    visit "/astronauts"

    expect(page).to have_content("Average Age: 50.3")
  end

  it "Shows a list of astronaut missions" do
    visit "/astronauts"

    expect(page).to have_content(@mission1.title)
    expect(page).to have_content(@mission1.time_in_space)
    expect(page).to have_content("Mission: Galaxy Sweep, Time In Space: 72 hours")
    expect(page).to have_content(@mission2.title)
    expect(page).to have_content(@mission2.time_in_space)
    expect(page).to have_content("Mission: Starbound, Time In Space: 144 hours")
  end
end
