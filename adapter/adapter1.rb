# 利用者(Client)：ターゲットのメソッドを呼び出す
# ターゲット(Target)：インターフェースを既定する
# アダプタ(Adapter)：アダプティのインターフェースを変換してターゲット向けのインターフェースを提供
# アダプティ(Adaptee)：実際に動作する既存のクラス

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

# Adapter
class PrintBanner
  def initialize(string)
    @banner = Banner.new(string)
  end

  def print_weak
    @banner.show_with_parent
  end

  def print_strong
    @banner.show_with_aster
  end

end


# 利用者(Client)
p = Print.new(PrintBanner.new("Hello"))
p.print_weak
p.print_strong

