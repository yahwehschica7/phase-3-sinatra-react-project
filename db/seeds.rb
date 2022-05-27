puts "🌱 Seeding spices..."


Category.create([
{
    name: "Horror",
    id: 1
},
{
    id: 2,
    name: "Literary"
}
])

Book.create([
{
  title: "The Gunslinger",
  author: "Stephen King",
  comment: "More of a fantasy",
  category_id: 1
},
{
    title: "The Book Thief",
    author: "Markus Zusak",
    comment: "Incredible writing!!",
    category_id: 2
}
])

p "Created #{Book.count} books"
p "Created #{Category.count} categories"

puts "✅ Done seeding!"
