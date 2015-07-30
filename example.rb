require 'json'
require './d_caesar.rb'

open("base64image2.json") do |io|
  arr = JSON.load(io)
  sorted = arr.sort_by { |hash| hash['id'].to_i }
  data = ""
  sorted.each do |a|
    decrypted_data = decrypt_with_caesar(a["data"], a["caesar"])
    data += decrypted_data
  end
  base64 = '<body>' + "<script>document.write('" + '<img  src="data:image/png;base64,' + data + '">' + "')</script>"
  File.write('ans2.html', base64)
end
