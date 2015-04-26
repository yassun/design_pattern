# Command ・・・ コマンドのインターフェイス
class Command
  attr_reader :description
  def initialize(description)
    @description = description
  end

  def execute
  end

end

# ConcreteCommand ・・・Commandの具体的な処理
class Kougeki < Command
  def initialize
    super("攻撃")
  end

  def execute
    puts "攻撃する"
  end
end

class Dougu < Command
  def initialize
    super("道具")
  end

  def execute
    puts "道具を使う"
  end
end

class Bougyo < Command
  def initialize
    super("防御")
  end

  def execute
    puts "防御する"
  end
end

class Nigeru < Command
  def initialize
    super("逃げる")
  end

  def execute
    puts "逃げる"
  end
end

class Character < Command
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  def description
    description = ""
    @commands.each { |cmd| description += cmd.description + "\n"}
    description
  end
end

# Client
yuusya = Character.new
yuusya.add_command(Bougyo.new)
yuusya.add_command(Kougeki.new)
yuusya.add_command(Dougu.new)
yuusya.add_command(Nigeru.new)
puts(yuusya.description)
yuusya.execute

budouka = Character.new
budouka.add_command(Kougeki.new)
budouka.add_command(Kougeki.new)
budouka.add_command(Kougeki.new)
budouka.add_command(Kougeki.new)
puts(budouka.description)
budouka.execute

