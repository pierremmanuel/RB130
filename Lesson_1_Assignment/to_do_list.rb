 class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.class == Todo

    @todos << todo
  end
  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos[index]
  end

  def mark_done_at(index)
    todos[index].done!
  end

  def mark_undone_at(index)
    todos[index].undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete_at(index)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

# we use self at the end to return the original TodoList object
  def each
    @todos.each { |todo| yield(todo) }
    self
  end

# Why can't we use select inside this method? Do we have to reuse custom methods??
  def select
    list = TodoList.new(title)

    each do |todo|
      list.add(todo) if yield(todo)
    end

    list
  end

  def find_by_title(string)
    each { |todo| return todo if todo.title == string }
    nil
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |todo| todo.done? == false }
  end

  def mark_done(string)
    each do |todo|
      if todo.title == string
        todo.done!
        return
      end
    end
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

puts list.find_by_title("Buy a bazooka")

# list.size
# list.first
# list.last
# list.to_a
# list.done?
#
# list.item_at(1)
# list.mark_done_at(1)
# list.mark_undone_at(1)
# list.done!
#
# list.to_s
