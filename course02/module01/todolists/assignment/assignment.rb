require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment
  def create_user(params)
    user = User.new(username: params[:username], password_digest: params[:password_digest])
    user.save
  end

  def create_todolist(params)
    todo_list = TodoList.new(list_name: params[:name], list_due_date: params[:due_date])
    todo_list.save
  end

  def find_allusers(offset, limit)
    User.
      all.
      limit(limit).
      offset(offset)
  end

  def find_alllists(offset, limit)
    TodoList.
      all.
      limit(limit).
      offset(offset).
      order(list_due_date: :desc)
  end

  def find_user_byname(username)
    User.where(username: username)
  end

  def find_todolist_byname(name)
    TodoList.where(list_name: name)
  end

  def get_user_byid(id)
    User.find(id)
  end

  def get_todolist_byid(id)
    TodoList.find(id)
  end

  def update_password(id, password_digest)
    user = User.find(id)

    user.password_digest = password_digest
    user.save
  end

  def update_listname(id, name)
    todo_list = TodoList.find(id)

    todo_list.list_name = name
    todo_list.save
  end

  def delete_user(id)
    User.find(id).destroy
  end

  def delete_todolist(id)
    TodoList.find(id).destroy
  end
end
