class Entry

  def get_name; end

  def get_size; end

  def print_list(prefix) end

end

class FileEntry < Entry
  def initialize(name, size)
    @name = name
    @size = size
  end

  def get_size
    @size
  end

  # ファイルの名称を返す
  def get_name
    @name
  end

  # ファイルのパスを返す
  def print_list(prefix)
    puts(prefix + "/" + get_name)
  end

end

# ディレクトリを表す(Composite)
class DirEntry < Entry
  def initialize(name)
    @title = name
    @directory = Array.new
  end

  def get_size
    sum = 0
    @directory.each do |e|
      sum = sum + e.get_size
    end
    sum
  end

  # ディレクトリの名称を返す
  def get_name
    @title
  end

  # ディレクトリにファイルを追加する
  def add(entry)
    @directory.push(entry)
  end

  # ファイル/ディレクトリのパスを返す
  def print_list(prefix)
    puts(prefix + "/" + get_name)
    @directory.each do |e|
      e.print_list(prefix + "/" + @title)
    end
  end

end

# ===========================================
root = DirEntry.new("root")
tmp = DirEntry.new("tmp")
tmp.add(FileEntry.new("conf",20))
tmp.add(FileEntry.new("data",100))
root.add(tmp)
root.print_list("")

puts root.get_size

