# 抽象表現(AbstractExpression)： 共通のインタフェースを定義
# 終端(TerminalExpression)： 終端を表現するクラス
# 終端以外(NonterminalExpression)： 非終端を表現するクラス
# 状況、文脈(Context)： 構文の解析を手助けする

class Operand
  def get_operand_string; raise 'Called abstract method !!'; end
end

# 対象
class Ingredient < Operand

  def initialize(operand_string)
    @operand_string = operand_string
  end

  def get_operand_string
    @operand_string
  end

end

# 結果
class Expression < Operand
  def initialize(operator)
    @operator = operator
  end

  def get_operand_string
    @operator.execute.get_operand_string
  end
end

# 処理
class Operator
  def execute; raise 'Called abstract method !!'; end
end

class Plus < Operator
  def initialize(operand1,operand2)
    @operand1 = operand1
    @operand2 = operand2
  end

  def execute
    Ingredient.new("#{@operand1.get_operand_string} に #{@operand2.get_operand_string} を足したもの ")
  end
end

class Wait < Operator
  def initialize(operand, minutes)
    @operand = operand
    @minutes = minutes
  end

  def execute
    Ingredient.new("#{@operand.get_operand_string} を #{@minutes} 分置いたもの ")
  end
end

puts Wait.new(Plus.new(Ingredient.new("カップ麺"), Ingredient.new("お湯")).execute, 3).execute.get_operand_string

