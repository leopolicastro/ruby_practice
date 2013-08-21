class Page

  attr_reader :url

  def initialize(url)
    @html = HTTParty.get(url)
    @html_body = Nokogiri::HTML(@html.body) 
  end

  def title 
    @html_body.search('title').map { |title| title.inner_text }
  end
  
  def links
    links = @html_body.css('a')
    links = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if {|href| href.empty?}
    links = links.map {|link| link.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/)}
    links = links.delete_if {|link| link.nil? }
  end

  def char_length
    @html_body.xpath("//text()").to_s.length
  end

end
