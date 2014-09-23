# GUI系のボタンの場合、iOS向けのパーツFactoryとAndroid向けパーツFactoryとかがあるように
# 矛盾のないオブジェクトの組み合わせを作る
# Rubyはクラスメソッドも継承される。

# Abstruct Product
class Item
  def initialize(caption)
    @caption = caption
  end

  def make_html
    raise 'Called abstract method !!'
  end
end

class Link < Item
  def initialize(caption,url)
    super(caption)
    @url = url
  end
end

class Tray < Item
  def initialize(caption)
    super(caption)
    @try = []
  end

  def add(item)
    @try << item
  end

end

class Page

  def initialize(title, auther)
    @title  = title
    @auther = auther
    @content = []
  end

  def add(item)
    @content << item
  end

  def output
    puts make_html()
  end

  def make_html
    raise 'Called abstract method !!'
  end

end


# Abstruct factory
class Factory

  def self.get_factory(class_name)
    class_name.new
  end

  def create_link
    raise 'Called abstract method !!'
  end

  def create_tray
    raise 'Called abstract method !!'
  end

  def create_page
    raise 'Called abstract method !!'
  end

end


# Concrete Product
class ListLink < Link
  def initialize(caption, url)
    super(caption, url)
  end

  def make_html
    "<li><a href=#{@url}> #{@caption} </a></li>\n"
  end
end

class ListTray < Tray
  def initialize(caption)
    super(caption)
  end

  def make_html
    buffer = "<li> #{@caption} </li> \n" + "<ul>"
    @try.each do |item|
      buffer = buffer + item.make_html
    end
    buffer = buffer + "</ul> \n" + "</li> \n"
  end
end

class ListPage < Page
  def initialize(title, auther)
    super(title, auther)
  end

  def make_html
    buffer = "<html> \n" + "<head><title> #{@title} </title></head>\n"
    buffer = buffer + "<ul>"
    @content.each do |item|
      buffer = buffer + item.make_html
    end
    buffer = buffer + "</ul>\n<hr>\n<address> #{@auther} </address>\n<html>"
  end

end

# Concrete Factory
class ListFactory < Factory

  def create_link(caption, url)
     ListLink.new(caption, url)
  end

  def create_tray(caption)
    ListTray.new(caption)
  end

  def create_page(title, auther)
    ListPage.new(title, auther)
  end
end

# Client
factory = Factory.get_factory(ListFactory)
asahi_link = factory.create_link("朝日新聞","http://asahi.com/")
tray_news   = factory.create_tray("新聞")
tray_news.add(asahi_link)

page       = factory.create_page("LinkPage","Name")
page.add(tray_news)

page.output


