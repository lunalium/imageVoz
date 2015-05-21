module Dir::Voz
  require 'open-uri'
  require 'nokogiri'
  def self.layanh(url,pbegin,pend)
    for pg in (pbegin..pend)
      begin
      page = Nokogiri::HTML(open(url+"&page="+"#{pg}"))
      puts page.css('title')
      linkpage = url + "&page=" + "#{pg}"
      puts linkpage
      link = page.css('img').select{|link| link['onload']== "NcodeImageResizer.createOn(this);"}
      link.each do |link|
      hinh= Hinhvoz.where(image:"#{link["src"]}").first || save= Hinhvoz.create(image:"#{link["src"]}",page:"#{linkpage}")
        end
      end
    end
  end

end




