# ---------------------------------
# Composite Pattern のデータ構造
class Entry
  def get_name; end
  def accept;   end
end

class FileEntry < Entry
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def accept(v)
    v.visit(self)
  end
end

class DirEntry < Entry
  def initialize(name)
    @title = name
    @directory = Array.new
  end

  def get_name
    @title
  end

  def get_itr
    @directory
  end

  def add(entry)
    @directory.push(entry)
  end

  def accept(v)
    v.visit(self)
  end
end

# ---------------------------------
# Visitor
class Visitor
  def visit; end
end

class ListVisitor < Visitor
  def initialize
    @current = ""
  end

  def visit(entry)
    if entry.instance_of?(FileEntry) then
      file_list(entry)
    end

    if entry.instance_of?(DirEntry) then
      dir_list(entry)
    end
  end

  def file_list(entry)
    puts "#{@current}/#{entry.get_name}"
  end

  def dir_list(entry)
    @current = @current << "/" << entry.get_name
    puts "#{@current}"
    itr = entry.get_itr
    itr.each do |e|
      e.accept(self)
    end
  end

end

tmp  = DirEntry.new("tmp")
tmp.add(FileEntry.new("conf"))
tmp.add(FileEntry.new("data"))

root = DirEntry.new("root")
root.add(FileEntry.new("conf"))
root.add(tmp)

root.accept(ListVisitor.new)

