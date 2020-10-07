Item.destroy_all
User.destroy_all

admin = User.create!(username: 'admin', email: 'jccdev45@gmail.com', password: 'changemepls')

puts "#{User.count} users created"

$search_terms = ['animal', 'pet', 'pet food', 'pet toy', 'pet groom', 'pet walk', 'dog', 'cat', 'rabbit', 'lizard', 'iguana', 'snake', 'chinchilla', 'ferret', 'guinea pig', 'frisbee', 'water bowl', 'kong toy', 'leash', 'puppy', 'kitten', 'bird', 'kibble', 'catnip', 'horse', 'fish', 'aquarium', 'fish tank']

$rating = [1, 2, 3, 4, 5]

10.times do
  Item.create(
    category: Faker::Commerce.department(max: 1),
    description: Faker::Hipster.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 2),
    image1: Faker::LoremFlickr.image(size: "1000x1000", search_terms: [$search_terms.sample.to_s]),
    image2: Faker::LoremFlickr.image(size: "1000x1000", search_terms: [$search_terms.sample.to_s]),
    image3: Faker::LoremFlickr.image(size: "1000x1000", search_terms: [$search_terms.sample.to_s]),
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 3..50.0),
    rating: $rating.sample,
    user: admin,
  )
end

puts "#{Item.count} items created"