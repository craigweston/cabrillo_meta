require "cabrillo_meta"
require 'json'

# parse qso template from STDIN
task :parse do
  qso_template = $stdin.read
  begin
    qso_meta = CabrilloMeta::Parser.parse_qso(qso_template)
    puts JSON.pretty_generate(qso_meta)
  rescue Exception => e
    puts "Error parsing qso template: `#{e.message}`"
  end
end

# parse qso templates from <pre/> tags in html document
task :parse_html do
  contests = []
  html = $stdin.read
  begin
   doc = Nokogiri::HTML(html)
   doc.xpath('//b').map do |node|
     contest = node.text
     qso_template = node.xpath('following-sibling::pre[1]').text
     next if qso_template.empty?
     begin
       qso_meta = CabrilloMeta::Parser.parse_qso(qso_template)
       res = { qso_meta: qso_meta }
       res = { contest: contest }.merge(res) unless contest.empty?
       contests << res
     rescue Exception => e
       raise "Error parsing contest: `#{contest}` - #{e.message}"
     end
   end
   puts JSON.pretty_generate({ contests: contests })
  end
end
