require 'Nokogiri'
require 'open-uri'
require 'Set'

def crawl(starting_links)
  seen = Set.new
  to_visit = starting_links
  until to_visit.empty?
    link = to_visit.shift
    seen << link
    links = grab_links(link)
    return link if links.empty?
    links.each do |new_link|
      next if seen.include?(new_link)
      to_visit << new_link
    end
  end
end

def grab_links(url)
  doc = Nokogiri::HTML(open(url))
  doc.css('a').map { |link| link['href'] }
end

puts crawl(["https://scottduane.github.io/SecretClue7",
  "https://scottduane.github.io/SecretClue1191",
  "https://scottduane.github.io/SecretClue4444"])
