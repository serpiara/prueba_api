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
        
        #pp body
        
        body.each do |photos_rover|
                puts photos_rover['id'.to_i]
                        photos_rover.each do |camera_rover|
                                puts camera_rover['sol'.to_i]
                        end
        end  
end

request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&","api_key=wqTZTANmx0kuzDXWqKHlCf39ggBaciwejQhSe7l3")
