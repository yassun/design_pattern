# Strategy         ・・・ 戦略的インターフェース
# ConcreteStrategy ・・・ 戦略の実装クラス
# Context          ・・・ インターフェースの呼び出し 

# Strategy
class Strategy
  def play_janken
    raise 'Called abstract method !!'
  end
end

# ConcreteStrategy
class ChokiStrategy < Strategy

  def play_janken
    puts "チョキ"
  end

end

# ConcreteStrategy
class RandomStrategy < Strategy

  def play_janken
    case rand(3)
    when 0 then
      puts "チョキ"
    when 1 then
      puts "グー"
    when 2 then
      puts "パー"
    end
  end

end

# Context
class Player
  def initialize(strategy)
    @strategy = strategy
  end

  def play_janken
    @strategy.play_janken
  end

end


player1 = Player.new(ChokiStrategy.new)
player2 = Player.new(RandomStrategy.new)

player1.play_janken
player2.play_janken

