#parsing html and css
require 'nokogiri' 
#request
require 'httparty'  

class RankSite
    def initialize(url="http://globo.com/")
        @url = url
        @rank = {}
    end
    
    def request
        rank_words(get_content(@url))
    end

    def get_content(url)
        lines = []
        page = Nokogiri::HTML(HTTParty.get(url))
        puts page

        #captura todos os elementos da tag <p>
        page.css('p').select do |children|
            lines << children.text.downcase.gsub(/(('|')|\:|!|\?|[...]|,)/,'').split(" ")
        end
        return lines
    end


    def rank_words(lines)
        lines.each do |words|
            words.each  do |k|
                if @rank.keys.include?(k)
                    @rank[k] += 1    
                else
                    @rank[k] = 1
                end
            end
        end
        #orderna em ordem decrescente
        @rank.sort_by{|k,v| v}.reverse
    end
end

a = RankSite.new.request
a.each{|v| puts "#{v}"}