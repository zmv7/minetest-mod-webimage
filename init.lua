local http = core.request_http_api()

function webimage(url, callback)
	if not url then
		callback("")
		return
	end
	http.fetch({
			url = url,
			timeout = 5,
		},
		function(res)
			local image_b64 = core.encode_base64(res.data)
			if type(image_b64) == "string" then
				local out = "[png:" .. image_b64
				callback(out)
			else
				callback("")
			end
		end
	)
end

core.register_chatcommand("http",{
  func = function(name,param)
	webimage(param, function(img)
			core.show_formspec(name, "test", "size[16,9]image[1,1;8,8;" .. img .. "]")
	end)
end})
