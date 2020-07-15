def request(url_requested)
        url = URI(url_requested)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        request = Net::HTTP::Get.new(url)
        request['app_id'] = 'serpiara@gmail.com'
        request['app_key'] = 'wqTZTANmx0kuzDXWqKHlCf39ggBaciwejQhSe7l3'
        response = http.request(request)
        return JSON.parse(response.body)
end



def buid_web_page
end