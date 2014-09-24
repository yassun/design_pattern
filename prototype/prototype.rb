# Prototype  ・・・コピーされるオブジェクトのインターフェース
# ConcretePrototype ・・・自身のコピーメソッド等をインターフェースに従って実装する。
# Client ・・・インスタンスをコピーして新しいインスタンスを作成する。

# Prototype
class Product
  def use
    raise 'Called abstract method !!'
  end

  def create_clone
    raise 'Called abstract method !!'
  end

end

# Client
class Manager
  def initialize
    @showcase = {}
  end

  def register(name, proto)
    @showcase[name] = proto
  end

  def create(proto_name)
    @showcase[proto_name].clone
  end

end

# ConcretePrototype
class MassageBox < Product
  def initialize(deco_char)
    @deco_char = deco_char
  end

  def use(s)
    length = s.length + 4

    length.times do
      print @deco_char
    end
    print "\n"

    print "#{@deco_char} #{s} #{@deco_char} \n"

    length.times do
      print @deco_char
    end
    print "\n"

  end
end

# 準備
manager = Manager.new
mbox = MassageBox.new('*')
sbox = MassageBox.new('/')

manager.register("warning box",mbox)
manager.register("slash box",sbox)


# 生成
p2 = manager.create("warning box")
p2.use("Hello, world")

p3 = manager.create("slash box")
p3.use("Hello, world")

