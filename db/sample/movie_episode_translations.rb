MovieEpisode.all.each do |episode|
  ADDITIONAL_LOCALES.keys.each do |locale|
    episode.translations.create(title: Faker::Lorem.words.join(' '),
                                description: Faker::Lorem.paragraph,
                                locale: locale.to_s)
  end
end
