# サブジェクト(subject)：変化する側のオブジェクト
# オブザーバ(Observer)：状態の変化を関連するオブジェクトに通知するインタフェース
# 具象オブザーバ(ConcreteObserver)：状態の変化に関連して具体的な処理を行う
require 'observer'

# subject
class RandomNumberGenerator

  # Observer
  include Observable

  attr_reader :number

  def initialize
    add_observer(DigitObserver.new)
    add_observer(GraphObserver.new)
  end

  def execute
    @number = rand(20) + 1

    # 更新フラグを立てる
    changed

    # オブザーバに通知する
    notify_observers(self)
  end
end

# ConcreteObserver
class DigitObserver
  def update(generator)
    puts "DigitObserver:#{generator.number}"
  end
end

# ConcreteObserver
class GraphObserver
  def update(generator)
    print "GraphObserver:"
    generator.number.times { print "*" }
    print "\n"
  end
end


10.times do
  gen = RandomNumberGenerator.new
  gen.execute
end

