require 'rails_helper'

RSpec.describe 'movies show view' do
  it 'shows the movies title, creation year, and genre, and all of the actors in the movie' do
    studio1 = create(:studio)

    movie1 = create(:movie, studio: studio1)
    movie2 = create(:movie, studio: studio1)

    actor1 = create(:actor)
    actor2 = create(:actor)
    actor3 = create(:actor)

    MovieActor.create(movie: movie1, actor: actor1)
    MovieActor.create(movie: movie1, actor: actor2)
    MovieActor.create(movie: movie1, actor: actor3)

    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).not_to have_content(movie2.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
  end
end
