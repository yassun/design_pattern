# Originator ・・・ mementoの作成とmementoからの復元を行う
# Memento    ・・・ Originator の状態を保存する。
# Caretaker  ・・・ Mementoの管理

# Memento
class Memento
  attr_accessor :money, :fruits
  def initialize(money, fruits)
    @money  = money
    @fruits = fruits
  end
end

# Originator
class Gamer
  attr_accessor :money
  def initialize(money)
    @money = money
    @fruits = []
    @fruit_names = ["りんご", "ぶどう", "バナナ", "みかん"]
  end

  def bet
    dice = rand(6) + 1
    if dice == 1 then
      @money = @money + 100
      puts "所持金が増えました"
    elsif dice == 2 then
      @money = @money / 2
      puts "所持金が半分になりました"
    elsif dice == 6 then
      f = get_fruit
      puts "フルーツを#{f}貰いました"
      @fruits << f
    else
      puts "何もおきませんでした"
    end
  end

  def get_fruit
    @fruit_names[rand(@fruit_names.length)]
  end

  def create_memento
    Memento.new(@money, @fruits)
  end

  def restore_memento(m)
    @money  = m.money
    @fruits = m.fruits
  end
end

# Caretaker 
gamer = Gamer.new(100)
m     = gamer.create_memento

100.times do
  puts " ---------------------------------------- "
  gamer.bet
  puts "所持金は#{gamer.money}円になりました"
  if gamer.money > m.money then
    puts "前回よりお金が増えているので、状態を保存します"
    m = gamer.create_memento
  elsif gamer.money < m.money / 2 then
    puts "お金がだいぶ減ったので、前回の状態に戻します"
    gamer.restore_memento(m)
  end
  puts " ---------------------------------------- "
end

