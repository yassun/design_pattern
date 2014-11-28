# State ・・・ 状態役 状態に依存した振る舞いを行う
# ConcreteState ・・・ 具象クラス
# Context ・・・状態の保持と処理の呼び出し
require 'singleton'

class State
  def move
    raise 'Called abstract method !!'
  end
end

class SlowMode < State
  include Singleton
  def move
    puts "SlowMove!!"
  end
end

class NomalMode < State
  include Singleton
  def move
    puts "NomalMove!!"
  end

end

class FastMode < State
  include Singleton
  def move
    puts "FastMove!!"
  end
end

class Stage

  def initialize
    @total_point = 0
    @mode = SlowMode.instance
  end

  def add_point(point)
    @total_point = @total_point + point
    @mode = get_mode
  end

  def game_overa
    @total_point = 0
    @mode = SlowMode.instance
  end

  def move
    @mode.move
  end

  private
    def get_mode
      if @total_point > 500 then
        FastMode.instance
      elsif @total_point > 100 then
        NomalMode.instance
      else
        SlowMode.instance
      end
    end

end

# ゲームスタート
game_stage = Stage.new
game_stage.move

# 点数の加算
game_stage.add_point(150)
game_stage.move

# 点数の加算
game_stage.add_point(500)
game_stage.move

# ゲームオーバー
game_stage.game_overa
game_stage.move

