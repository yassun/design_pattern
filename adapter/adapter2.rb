# 特異メソッド版

# Adaptee
class Banner

  def initialize(string)
    @string = string
  end

  def show_with_parent
    puts "( #{@string} )"
  end

  def show_with_aster
    puts "* #{@string} *"
  end

end

# Target
class Print
  def initialize(obj)
    @obj = obj
  end

  def print_weak
    @obj.print_weak
  end

  def print_strong
    @obj.print_strong
  end
end

banner = Banner.new("Hello")

def banner.print_weak
  show_with_parent
end

def banner.print_strong
  show_with_aster
end

p = Print.new(banner)

p.print_weak
p.print_strong

