local f, d="wl.key", (gethwid():gsub(".",function(c)return("%02x"):format(c:byte())end))
if not isfile(f)then writefile(f,d)
elseif readfile(f)~=d then game.Players.LocalPlayer:Kick("Error 243") writefile(f,d)end
if not({["65373932636264616534386639636138373637323034346638633434336434656435646533623835316430313935303032616235643133656466353434396366"]=true})[readfile(f)]then game.Players.LocalPlayer:Kick("Error 233")end
