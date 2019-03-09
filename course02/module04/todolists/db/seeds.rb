# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Profile.delete_all
User.delete_all
TodoList.delete_all
TodoItem.delete_all

user = User.create({ username: 'Fiorina', password_digest: 'asdf' })
Profile.create(
  { gender: 'female', birth_year: 1954, first_name: 'Carly', last_name: 'Fiorina', user: user }
)
user = User.create({ username: 'Trump', password_digest: 'asdf' })
Profile.create(
  { gender: 'male', birth_year: 1946, first_name: 'Donald', last_name: 'Trump', user: user }
)
user = User.create({ username: 'Carson', password_digest: 'asdf' })
Profile.create(
  { gender: 'male', birth_year: 1951, first_name: 'Ben', last_name: 'Carson', user: user }
)
user = User.create({ username: 'Clinton', password_digest: 'asdf' })
Profile.create(
  { gender: 'female', birth_year: 1947, first_name: 'Hillary', last_name: 'Clinton', user: user }
)

User.all.each do |user|
  todo_list = TodoList.create(
    { list_name: 'MyList', list_due_date: Date.today + 1.year, user: user }
  )
  5.times do |i|
    TodoItem.create(
      {
        due_date: Date.today + 1.year, title: "Task #{i}", description: "Description #{i}",
        completed: false, todo_list: todo_list
      }
    )
  end
end

