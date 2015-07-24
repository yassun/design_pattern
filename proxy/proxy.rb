# 仮想プロキシー ・・・ 必要になった時点でインスタンスを作成。処理速度の向上など
# 遠隔プロキシー ・・・ ネットワーク先などにあるシステムを透過的に使えるようにする。
# 防御プロキシー ・・・ セキュリティ上必ずログインチェックが必要な処理など。

# 仮想プロキシー
# Subject(主体) ・・・ ProxyとRealSubjectを同一視するためのAPI
#                      Client(Main)から透過的にアクセスできるようにするために使用する。
# Proxy(代理人) ・・・ Clientからの要求を出来るだけ処理し、不可な場合のみRealSubjectの処理を委譲で呼び出す。
# RealSubject(主体の実装)


class Printable
  def set_printer_name(name) ; raise 'Called abstract method !!' ; end
  def get_printer_name ; raise 'Called abstract method !!' ; end
  def print(string) ; raise 'Called abstract method !!' ; end
end

class Printer < Printable
  attr_accessor :name

  def initialize(name)
    @name = name
    heavy_job("Printerのインスタンスを作成中")
  end

  def print(string)
    puts "=== #{@name} ==="
    puts "#{string}"
  end

  private
    def heavy_job(msg)
      puts "#{msg}"
      puts "完了"
    end
end

class PrinterProxy < Printable

  def initialize(name)
    @name = name
  end

  def set_printer_name(name)
    @real.name(name) if @real
    @name = name
  end

  def get_printer_name
    @name
  end

  def print(string)
    realize
    @real.print(string)
  end

  private
    def realize
      @real = Printer.new(@name) unless @real
    end
end


p = PrinterProxy.new("Alice")
puts p.get_printer_name

p.set_printer_name("Bob")
puts p.get_printer_name

p.print("Hello, World")

