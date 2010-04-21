function fuckduke
  for i in 254 253 252 251 250 249 248 247 246 245 244 243 242 241 240 239 238 237 236 235 234 233 232 231 230 229 228 227 226 225 224 223 222 221 220 219 218 217 216 215 214 213 212 211 210 209 208 207 206 205 204 203 202 201 200
    sudo ifconfig en1 add 10.0.1.$i 255.255.255.0
    sleep 2
    echo $i
#    for x in $argv
#      curl http://pants.local/entries/$x/vote -b "_dukejour_session=session=BAh7BzoPc2Vzc2lvbl9pZCIlZjMyYTc0NjcxYzQ0OGE4OWJjNjc1MTE5ZmQ2ZjYwZjM6EF9jc3JmX3Rva2VuIjE0MzI5QUliTEpxTkFlMkNDUXo0SnU5SGtweG05N0hZY0NRZmtRQzNHUFVrPQ%3D%3D--031df824ca2d9f019989025b27abff60d141d26e" -d "_method=post&format=jug" --referer "http://pants.local/"  -H "X-Requested-With: XMLHttpRequest"
#    end
    sudo ifconfig en1 delete 10.0.1.$i
  end
end
