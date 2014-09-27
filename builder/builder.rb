# Director：Builderで提供されているインタフェースのみを使用して処理を行う
# Builder ：各メソッドのインタフェースを定める
# ConcreteBuilder：Builderが定めたインタフェースの実装

class Director

  def initialize(builder)
    @builder = builder
  end

  def construct
    @builder.make_string
    @builder.close
  end

end

class Builder
  def initialize(class_name)
    @builder = class_name.new
  end

  def make_string
    @builder.make_string
  end

  def close
    @builder.close
  end

  def get_result
    @builder.get_string
  end

end

class TextBuilder

  def initialize
    @buffer = ""
  end

  def make_string
    @buffer = @buffer + "TextTextText"
  end

  def close
    @buffer = @buffer + "EOF"
  end

  def get_string
    @buffer
  end

end

class HTMLBuilder

  def initialize
    @buffer = ""
  end

  def make_string
    @buffer = @buffer + "HTMLHTMLHTML"
  end

  def close
    @buffer = @buffer + "EOF"
  end

  def get_string
    @buffer
  end
end

text_builder = Builder.new(TextBuilder)
director1 = Director.new(text_builder)
director1.construct
p text_builder.get_result


html_builder = Builder.new(HTMLBuilder)
director2 = Director.new(html_builder)
director2.construct
p html_builder.get_result

