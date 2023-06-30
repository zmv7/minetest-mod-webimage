# minetest-mod-webimage
Function that provides getting PNG images from the web
### Installation
* Put it like other mods into `mods` or `worldmods` directory.
* Add `webimage` to `secure.http_mods` setting.
### Usage
```lua
webimage(url, function(img)
  --do something with img
end)
```
#### Example
```lua
core.register_chatcommand("viewimage",{
  description = "View image from the web",
  privs = {server=true},
  params = "<Image_URL>",
  func = function(name,param)
    webimage(param, function(img)
      core.show_formspec(name, "webimage_view", "size[9,9]image[1,1;8,8;" .. img .. "]")
    end)
end})
```
