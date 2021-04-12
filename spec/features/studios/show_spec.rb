require 'rails_helper'

RSpec.describe 'studios show view' do
  it 'shows the studios name and location and the titles of all of its movies' do
    studio1 = create(:studio)
    movie1 = create(:movie, studio: studio1)
    movie2 = create(:movie, studio: studio1)

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
  end
end
