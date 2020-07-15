def request(address,app_key)
    require "uri"
    require "net/http"
    require 'json'
        url = URI"#{address}#{app_key}"
        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true
        request = Net::HTTP::Get.new(url)
        response = https.request(request)
#puts response.read_body.class
        body = JSON.parse response.read_body
#Este es el hash
#puts body.class  
        return body
end     


def buid_web_page(body)
#puts body
#puts body['photos']
    new_array = []
    new_array = body['photos']

    puts new_array[1]['img_src']
    inicio = 0
        new_array.each do |x|
            puts "<html>\n<head>\n</head>\n\t<body>\n\t\t<ul>"
            identi = new_array[inicio]['id']
            imagen = new_array[inicio]['img_src']
puts identi
puts imagen
            inicio += 1                
            puts "\n\t\t<ul>\n\t</body>\n</html>"
        end

end

#Bloque del programa

#request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&","api_key=wqTZTANmx0kuzDXWqKHlCf39ggBaciwejQhSe7l3")
buid_web_page(request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&","api_key=wqTZTANmx0kuzDXWqKHlCf39ggBaciwejQhSe7l3"))

