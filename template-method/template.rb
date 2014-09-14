class AbstractDisplay

  def open
    raise 'Called abstract method !!'
  end

  def out_put
    raise 'Called abstract method !!'
  end

  def close
    raise 'Called abstract method !!'
  end

  def display
    open
    5.times {
      out_put
    }
    close
  end

end

class CharDisplay < AbstractDisplay

  def initialize(str)
    @str = str
  end

  def open
    print "<<<"
  end

  def out_put
    print "#{@str}"
  end

  def close
    print ">>>"
    print "\n"
  end

end

class StringDisplay < AbstractDisplay

  def initialize(str)
    @str = str
  end

  def open
    print_line
  end

  def out_put
    puts "| #{@str} |"
  end

  def close
    print_line
  end

  def print_line

    print "+ "
    @str.length.times {
      print "-"
    }
    print " +"
    print "\n"

  end

end

char_display = CharDisplay.new("H")
char_display.display

string_display = StringDisplay.new("Hello World")
string_display.display

