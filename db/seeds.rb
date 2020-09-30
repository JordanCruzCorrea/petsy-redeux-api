Item.destroy_all
User.destroy_all

admin = User.create!(username: 'admin', email: 'jccdev45@gmail.com', password: 'changemepls')

puts "#{User.count} users created"

$search_terms = ['animal', 'pet', 'pet food', 'pet toy', 'pet groom', 'pet walk', 'dog', 'cat', 'rabbit', 'lizard', 'frisbee', 'water bowl', 'kong toy', 'leash', 'puppy', 'kitten', 'bird', 'kibble', 'catnip', 'horse', 'fish', 'aquarium', 'fish tank']

10.times do
  Item.create(
    name: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraph(sentence_count: 1, supplemental: true, random_sentences_to_add: 2),
    category: Faker::Commerce.department(max: 1),
    price: Faker::Commerce.price(range: 3..50.0),
    user: admin,
    images: Faker::LoremFlickr.image(size: "500x500", search_terms: [$search_terms.sample.to_s])
  )
end

puts "#{Item.count} items created"