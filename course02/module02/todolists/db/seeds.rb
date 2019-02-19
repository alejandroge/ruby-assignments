# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Profile.delete_all
User.delete_all

[
  { first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954 },
  { first_name: 'Donald', last_name: 'Trump', birth_year: 1946 },
  { first_name: 'Ben', last_name: 'Carson', birth_year: 1951 },
  { first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947 }
].each do |u|
  user = User.create({ username: u[:last_name], password_digest: 'asdf' })
  gender = if u[:first_name].include? 'y'
             'female'
           else
             'male'
           end
  Profile.create(
    {
      gender: gender, birth_year: u[:birth_year], first_name: u[:first_name],
      last_name: u[:last_name], user: user
    }
  )
  todo_list = TodoList.create(
    { list_name: 'MyList', list_due_date: Date.today + 1.year }
  )
  5.times do |i|
    TodoItem.create(
      {
        due_date: Date.today + 1.year, title: "Task #{i}", description: "Description #{i}",
        completed: false, todo_list: todo_list
      }
    )
  end
  user.todo_lists << todo_list
end

