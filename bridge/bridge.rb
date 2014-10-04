# Brideパターン
# 機能のクラス階層と実装のクラス階層を
# 分割して委譲を使用して繋げる

####################
# 機能のクラス階層 #
####################
class Display

  def initialize(impl)
    @impl = impl
  end

  def open
    @impl.raw_open
  end

  def print
    @impl.raw_print
  end

  def close
    @impl.raw_close
  end

  def display
    open
    print
    close
  end

end

class CountDisplay < Display

  def initialize(impl)
    super(impl)
  end

  def multi_display(cnt)
    open
    cnt.times { print }
    close
  end

end


####################
# 実装のクラス階層 #
####################
class DisplayImpl

  def initialize(string)
    @string = string
  end

  def raw_open
    raise 'Called abstract method !!'
  end

  def raw_print
    raise 'Called abstract method !!'
  end

  def raw_close
    raise 'Called abstract method !!'
  end

end

class StringDisplay < DisplayImpl

  def initialize(string)
    super(string)
  end

  def raw_open
    print_line
  end

  def raw_print
    puts "|#{@string}|"
  end

  def raw_close
    print_line
  end

  def print_line
    print "+"
    @string.length.times { print "-" }
    print "+"
    print "\n"
  end

end

di1 = Display.new(StringDisplay.new("Hello Japan"))
di1.display

di2 = CountDisplay.new(StringDisplay.new("Hello Japan"))
di2.multi_display(3)

