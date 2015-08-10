class Mediator
  def create_colleagues
  end

  def colleague_change
  end

end

class Colleague
  def set_meditor
  end

  def set_colleague_enable
  end

end

class ColleagueButton < Colleague
  attr_accessor :status
  def set_meditor(mediator)
    @mediator = mediator
  end
  def set_colleague_enable(enable)
    @status = enable
  end
end

class ColleagueText < Colleague
  attr_accessor :text
  def set_meditor(mediator)
    @mediator = mediator
  end
  def text_change(text)
    @text = text
    @mediator.colleague_change
  end
end

class Frame < Mediator

  def create_colleagues
    @button = ColleagueButton.new
    @input  = ColleagueText.new

    @button.set_meditor(self)
    @input.set_meditor(self)
  end

  def colleague_change
    if @input.text.length > 10
      @button.set_colleague_enable(false)
    else
      @button.set_colleague_enable(true)
    end
  end

  def text_add(text)
    puts "テキストに #{text} が入力されました"
    @input.text_change(text)
  end

  def button_click
    if @button.status
      puts "ボタンクリック可能です！"
    else
      puts "ボタンクリック不可です！"
    end
  end

end


frame = Frame.new
frame.create_colleagues

frame.text_add("hoge")
frame.button_click

frame.text_add("hughugahugahugahugahuga")
frame.button_click

