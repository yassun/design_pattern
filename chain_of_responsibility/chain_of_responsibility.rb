class Truble
  def initialize(number)
    @number = number
  end
  def get_number
   @number
  end
end

# Handler たらい回し先の保持と判断を行う。
class Support
  def initialize(name)
    @name = name
  end

  def set_next(next_obj)
    @next_obj = next_obj
    next_obj
  end

  def support(trouble)
    if resolve(trouble)
      done
    elsif @next_obj != nil
      puts "#{@name} 解決できないのでたらい回し"
      @next_obj.support(trouble)
    else
      fail
    end
  end

  def done
    puts "#{@name} 解決しました"
  end

  def fail
    puts "終点 #{@name} 解決できませんでした"
  end

end

# ConcreteHandler 上記の具象クラス
class NoSupport < Support
  def initialize(name)
    super(name)
  end

  def resolve(trouble)
    return false
  end

end

class SpecialSupport < Support
  def initialize(name, number)
    super(name)
    @number = number
  end

  def resolve(trouble)
    if trouble.get_number == @number
      return true
    else
      return false
    end
  end
end


no_support1 = NoSupport.new("no_support1")
no_support2 = NoSupport.new("no_support2")
no_support3 = NoSupport.new("no_support3")
sp_support1 = SpecialSupport.new("sp_support1",3)

no_support1.set_next(no_support2).set_next(no_support3).set_next(sp_support1)
no_support1.support(Truble.new(4))
no_support1.support(Truble.new(3))


