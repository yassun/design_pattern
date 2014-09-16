# 
# Creator: ConcreteFactoryの共通部分の処理を行う
# ConcreteCreator: 実際にオブジェクトの生成を行う
# Product: ConcreteFactoryによって生成される側のオブジェクト共通部分
# ConcreteProduct: 生成されるオブジェクト

class Factory

  def create(owner)
    p = create_product(owner)
    register_product(p)
    return p
  end

  def create_product
    raise 'Called abstract method !!'
  end

  def register_product
    raise 'Called abstract method !!'
  end

end

class Product
  def use
    raise 'Called abstract method !!'
  end
end

class IDCardFactory < Factory

  def initialize
    @owners = []
  end

  def create_product(owner)
    IDCard.new(owner)
  end

  def register_product(product)
    @owners << product
  end

  def getOwners
    retrun @owners
  end

end

class IDCard < Product

  def initialize(owner)
    puts "#{owner} のカードを作ります"
    @owner = owner
  end

  def use
    puts "#{@owner} のカードを使います"
  end

  def get_owner
    @owner
  end

end

factory = IDCardFactory.new

card1 = factory.create("高坂 穂乃果")
card2 = factory.create("園田 海未")
card3 = factory.create("南 ことり")

card1.use
card2.use
card3.use


