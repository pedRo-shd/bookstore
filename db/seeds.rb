person = Person.find_or_create_by(
  name: "Admin",
  email: "admin@bookstore.com.br",
  born_at: "1990-05-30",
  admin: true
)

person.password = 'testeteste'
person.save
