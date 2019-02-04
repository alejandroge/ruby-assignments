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

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      # accept an id and password_digest input parameters
      # use the User Model class to update the `password_digest` for the User associated with the id primary key
      # (no return is required)
  end

  def update_listname(id, name)
      # accept an id and name input parameters
      # use the TodoList Model class to update the `list_name` for the TodoList associated with id primary key 
      # (no return is required)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
      # accept an id input parameter
      # use the User Model class to remove the User associated with the `id` primary key from the database
      # (no return is required)
  end 

  def delete_todolist(id)
      # accept an id input parameter
      # use the TodoList Model class to remove the TodoList associated with the `id` primary key.
      # (no return is required)
  end
end
