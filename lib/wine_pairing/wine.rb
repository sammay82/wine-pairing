class WinePairing::Wine
  attr_accessor :name, :description, :taste

  def self.list
    self.scrape_wines
  end

  def self.scrape_wines
    wines = []
    wines << self.scrape_red
    wines << self.scrape_white
    wines << self.scrape_light
    wines << self.scrape_versatile
    wines
  end

  def self.scrape_red
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Merlot"))

    wine = self.new
    wine.name = doc.search("h1#firstHeading.firstHeading").text.strip
    wine.description = doc.search("table.infobox biota p").third.text.strip.downcase
    wine.taste = "dry"
  end

  def self.scrape_white
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Riesling"))

    wine = self.new
    wine.name = doc.search("h1#firstHeading.firstHeading").text.strip
    wine.description = doc.search("table.infobox biota p").first.text.strip.downcase
    wine.taste = "sweeter"
  end

  def self.scrape_light
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Sauvignon_blanc"))

    wine = self.new
    wine.name = doc.search("h1#firstHeading.firstHeading").text.strip
    wine.description = doc.search("table.infobox biota p").second.text.strip.downcase
    wine.taste = "dry,sweet"
  end

  def self.scrape_versatile
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Pinot_noir"))

    wine = self.new
    wine.name = doc.search("h1#firstHeading.firstHeading").text.strip
    wine.description = doc.search("div.thumbinner p").second.text.strip.downcase
    wine.taste = "slightly dry, slightly sweet"
  end    
end