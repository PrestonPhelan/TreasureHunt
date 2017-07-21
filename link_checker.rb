require 'Nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://scottduane.github.io/TopSecretClue/'))

links = doc.css('li a').map { |link| link['href'] }

def check_links(links)
  links.select do |link|
    begin
      counter += 1
      r = open(link)
    rescue
      p "#{counter} Not working link"
      false
    else
      p link
      true
    end
  end
end

puts check_links(links)
