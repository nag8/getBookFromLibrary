require 'open-uri'
require 'nokogiri'

uri = "http://www…"
page = URI.parse(uri).read
charset = page.charset
if charset == "iso-8859-1"
  charset = page.scan(/charset="?([^\s"]*)/i).first.join
end

document = Nokogiri::HTML(page, uri, charset)

def get_next_page(current_page, soup_res):

    pagination_list = []
    pl = soup_res.find_all("a", class_="bm-pagination__link")
    for l in pl:
        pagination_list.append([l.string, l.get("href")])

    next_page_no = None
    for pagination in pagination_list:
        if str(current_page) in pagination:
            next_page_no = pagination[1]
    return(next_page_no)