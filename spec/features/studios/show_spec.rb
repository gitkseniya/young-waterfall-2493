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

  it 'shows a list of actors that have acted in any of the studios movies' do
    studio1 = create(:studio)

    movie1 = create(:movie, studio: studio1)
    movie2 = create(:movie, studio: studio1)

    actor1 = create(:actor, age: 30)
    actor2 = create(:actor, age: 55)
    actor3 = create(:actor, age: 41)

    MovieActor.create(movie: movie1, actor: actor1)
    MovieActor.create(movie: movie1, actor: actor2)
    MovieActor.create(movie: movie1, actor: actor3)

    MovieActor.create(movie: movie2, actor: actor1)
    MovieActor.create(movie: movie2, actor: actor2)

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)

    expect(studio1.unique_actors.count).to eq(3)
    expect(actor2).to appear_before(actor1)
  end
end
