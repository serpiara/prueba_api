def request(address,app_key)
    require "uri"
    require "net/http"
    require 'json'
        url = URI"#{address}#{app_key}"
        https = Net::HTTP.new(url.host, url.port);
        https.use_ssl = true
        request = Net::HTTP::Get.new(url)
        response = https.request(request)
        body = JSON.parse response.read_body
        return body
end     

def buid_web_page(body)
    new_array = []
    new_array = body['photos']
        output = "<html>\n<head>\n</head>\n\t
        <body>Image data gathered by NASA's Curiosity, Opportunity, and Spirit rovers on Mars\n\t\t<ul>"
        inicio = 0
        new_array.each do |x|            
            imagen = new_array[inicio]['img_src']
            output += "\n\t\t<li><img src='#{imagen}' width='200' height='200'></li>"
            inicio += 1                      
        end
        output += "\n\t\t<ul>\n\t</body>\n</html>"
        File.write('index.html',output)      
end

#Bloque del programa
buid_web_page(request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&","api_key=wqTZTANmx0kuzDXWqKHlCf39ggBaciwejQhSe7l3"))
