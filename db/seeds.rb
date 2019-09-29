User.create(email: 'user@example.com', name: 'nicolas', last_name: 'vargas', password: "1234567890")

Movie.create!(title: 'pelicula 1', description: 'es la peli 1', recommended: false, age_rating: 'suitable_for_over_15', release_data: '2000-12-22')
Movie.create!(title: 'Doom', description: 'test', recommended: true, age_rating: 'suitable_for_over_15', release_data: '2000-06-22')
Movie.create!(title: 'Annabelle 3', description: 'terror', recommended: false, age_rating: 'suitable_for_over_18', release_data: '2000-06-22')
Movie.create!(title: 'Spiderman', description: 'marvel studios', recommended: true, age_rating: 'recommended_for_over_7', release_data: '2000-06-22')
