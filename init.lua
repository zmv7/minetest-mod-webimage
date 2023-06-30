local http = core.request_http_api()

function webimage(url, callback)
	if type(callback) ~= "function" then
		return
	end
	if type(url) ~= "string" then
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
