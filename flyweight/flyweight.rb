# Flyweight ・・・ 共有対象のクラス
# FlyweightFactory ・・・ Flyweightの生成役、作成済の場合はインスタンスを再利用する。

require 'singleton'

class BigChar
  def initialize(char)
    @char = char
  end
  def print_big_char
    puts "大量にメモリを消費する #{@char}"
  end
end

class BigCharFactory
  include Singleton

  def initialize
    @pool = {}
  end

  def get_big_char(char)
    if @pool.key?(char) then
       @pool[char]
    else
       puts "インスタンス作成"
       @pool[char] = BigChar.new(char)
       @pool[char]
    end
  end
end

class BigString
  def initialize(str)
    @str = str
    @big_char_factory = BigCharFactory.instance
  end
  def print_big_string
    @str.split(//).each do |char|
      big_char = @big_char_factory.get_big_char(char)
      big_char.print_big_char
    end
  end
end

big_string = BigString.new('ABBCCCABC')
big_string.print_big_string

