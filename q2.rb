require 'json'
require './caesar.rb'

all = []
all.concat(Array('A'..'Z'))
all.concat(Array('a'..'z'))
all.concat(Array('0'..'9'))
all.concat(["+","=","/"])
# p all[rand(all.length-1)]

arr =[]
open(ARGV[0]) do |io|
	arr = io.each_char.each_slice(10).map{|a| a.join}
end
arr.pop()

plane_jsonarr = []
enc_jsonarr = []
arr.each_with_index do |data,i|
	randstr_idx = rand(26)
	encrypted_data = encrypt_with_caesar(data, randstr_idx)
	hash ={id:i,data:encrypted_data,caesar:randstr_idx}
	hash2 ={id:i,data:data}
	enc_jsonarr.push(hash)
	plane_jsonarr.push(hash2)
end

enc_jsonarr.shuffle!(random: Random.new(445))
plane_jsonarr.shuffle!(random: Random.new(445))

open("base64image1.json", "w") do |io|
	JSON.dump(plane_jsonarr, io)
end

open("base64image2.json", "w") do |io|
	JSON.dump(enc_jsonarr, io)
end
