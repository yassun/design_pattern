class Database

  def initialize(name)
    @name = name
  end

  def get_properties
   return @name
  end

end

class HtmlWriter
  def start
    puts "<html>"
  end

  def title(title)
    puts "<head>"
    puts "<title>#{title}</title>"
    puts "</head>"
  end

  def paragraph(msg)
    puts "<p>#{msg}</p>"
  end

  def link(href, caption)
    puts "<a href=#{href}> #{caption} </a>"
  end

  def end
    puts "</html>"
  end

end

class PageMaker
  def make_page
    db = Database.new("hogehoge")
    html_writer = HtmlWriter.new

    html_writer.start
    html_writer.title(db.get_properties)
    html_writer.paragraph("ABCDE")
    html_writer.link("http://hoge.hoge.hoge","Hoge Link")
    html_writer.paragraph("FGHIJ")
    html_writer.link("http://huga.huga.huga","Huga Link")
    html_writer.end

  end
end

page_maker = PageMaker.new
page_maker.make_page

