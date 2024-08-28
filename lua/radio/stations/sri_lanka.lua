local stations = {
    {name = "Parani Gee", url = "http://151.80.42.191:8288/stream"},
    {name = "FOX 914 FM", url = "http://142.132.250.174:7673/stream"},
    {name = "V FM", url = "http://dc1.serverse.com:7178/stream/1/"},
    {name = "Lakviru Radio", url = "http://cp11.serverse.com:7643/stream"},
    {name = "Lankasri Fm", url = "http://media2.lankasri.fm/;stream.mp3"},
    {name = "Sky Radio", url = "https://cp11.serverse.com/proxy/skyradio/stream"},
    {name = "Wow රේඩියෝ", url = "https://cp11.serverse.com/proxy/wowradio/stream"},
    {name = "Classic Radio", url = "https://cp11.serverse.com/proxy/classic/stream"},
    {name = "SLBC Asia Service", url = "http://220.247.227.6:8000/Asiastream"},
    {name = "Lakhanda", url = "https://cp12.serverse.com/proxy/itnfm?mp=/stream"},
    {name = "SLBC -Swadeshiya Sewaya", url = "http://220.247.227.6:8000/Snsstream"},
    {name = "SLBC -Radio Sri Lanka", url = "http://220.247.227.20:8000/RSLstream"},
    {name = "Rajarata Sewaya", url = "http://220.247.227.20:8000/rajaratastream"},
    {name = "SLBC -Welanda Sewaya", url = "http://220.247.227.6:8000/Scomstream"},
    {name = "LAKHANDA RADIO", url = "https://cp12.serverse.com/proxy/itnfm?mp=/stream&1707017036"},
    {name = "Isira TNL", url = "http://124.43.10.122:8080/live"},
    {name = "Radio Plus Sri Lanka", url = "https://altair.streamerr.co/stream/8036"},
    {name = "SLBC -City FM", url = "http://220.247.227.20:8000/citystream"},
    {name = "E FM", url = "http://207.148.74.192:7860/stream.mp3"},
    {name = "Tube Tamil FM Radio டியூப் தமிழ் எஃப்எம் பண்பலை ரேடியோ", url = "http://s2.voscast.com:12084/;stream1619441439791/1"},
    {name = "Golden Maple Radio", url = "http://s46.myradiostream.com:11156/listen.mp3"},
    {name = "Radio Plus Hitz", url = "https://altair.streamerr.co/stream/8054"},
    {name = "Laksara", url = "https://5a1178b42cc03.streamlock.net/laksara/laksara/chunklist_w1617919055.m3u8"},
    {name = "Rangiri Sri Lanka", url = "https://rangiri.radioca.st/stream"},
    {name = "Sri FM", url = "http://207.148.74.192:7860/stream2.mp3"},
    {name = "Ran FM", url = "http://207.148.74.192:7860/ran.mp3"},
    {name = "Kothmale FM", url = "https://s11.myradiostream.com:25116/listen.mp3"},
    {name = "Siyath Fm", url = "https://srv01.onlineradio.voaplus.com/siyathafm"},
    {name = "Bestcoastfm", url = "http://streams.radio.co/sea5dddd6b/listen"},
    {name = "Sirasa FM", url = "http://live.trusl.com:1170/;"},
    {name = "Yes FM", url = "http://live.trusl.com:1150/"},
    {name = "Yes FM Online", url = "http://live.trusl.com:1150/;"},
    {name = "Siyatha FM", url = "http://live.trusl.com:1170/;?type=http&nocache=0"},
    {name = "Sitha FM", url = "http://shaincast.caster.fm:48148/listen.mp3"},
    {name = "Ever Fm", url = "https://stream-172.zeno.fm/xtereyhnqc9uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ4dGVyZXlobnFjOXV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Im9oUDJNRTY0UXIydWFLaDRkYVl3YUEiLCJpYXQiOjE3MjQ4MzM2NjUsImV4cCI6MTcyNDgzMzcyNX0.czRJZ5CvERjSwq9wDmwq2XrgfWdDlqnraaGvOsCUWqw"},
    {name = "SL Vlog Radio", url = "https://s2.radio.co/s58b83c966/listen"},
    {name = "Gold FM", url = "https://radio.lotustechnologieslk.net:2020/stream/goldfmgarden"},
    {name = "Gold FM - 932 Backup", url = "https://radio.lotustechnologieslk.net:8000/"},
    {name = "Hiru FM", url = "https://radio.lotustechnologieslk.net:2020/stream/hirufmgarden"},
    {name = "Gumnada", url = "https://stream-159.zeno.fm/e7ztn80wttzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJlN3p0bjgwd3R0enV2IiwiaG9zdCI6InN0cmVhbS0xNTkuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjVOQmE1cHQ0UnY2SWk2UmtpME5LVXciLCJpYXQiOjE3MjQ3OTM3MDAsImV4cCI6MTcyNDc5Mzc2MH0.Hn4f8N0aUZN_7v0PoxCfjZGKsvZKUuUzYEXu2ipa3No"},
    {name = "Mark FM", url = "http://stream-172.zeno.fm/28b20q2fps8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIyOGIyMHEyZnBzOHV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkE1aUV2R3JSUVF1QVlpdHowQTJnclEiLCJpYXQiOjE3MjQ4MzI3MzEsImV4cCI6MTcyNDgzMjc5MX0.ejNd5kUouoGFkf5lme3nv9_Xx60o9HPjziev-3JLPLM"},
    {name = "Youth One Radio", url = "https://stream-154.zeno.fm/lv1egsq3wejvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJsdjFlZ3NxM3dlanZ2IiwiaG9zdCI6InN0cmVhbS0xNTQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkpJazFCQW9NUnJDOXkzSDNVSGlzM2ciLCJpYXQiOjE3MjQ4NDQ4MTYsImV4cCI6MTcyNDg0NDg3Nn0.tt0jcybfP3mRbflM7yal7aY47DQFZqxfqAOKx6E2Do0"},
    {name = "The One Radio", url = "http://stream-172.zeno.fm/e8ssd0gtrldtv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJlOHNzZDBndHJsZHR2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Il9xY0psc0x6VHNlUXE1Nl9fMEZDd3ciLCJpYXQiOjE3MjQ4Mjc4ODcsImV4cCI6MTcyNDgyNzk0N30.Lu7sWfdco6-hwQkegrpzauR0dBvfY5ygOSfCEni0mik"},
    {name = "Gospel Music Radio Srilanka", url = "http://stream-175.zeno.fm/emsfpc2m7x8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJlbXNmcGMybTd4OHV2IiwiaG9zdCI6InN0cmVhbS0xNzUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImhNTVlYY292UjhlSzk4TjNKeW9ySUEiLCJpYXQiOjE3MjQ4NDcxMzksImV4cCI6MTcyNDg0NzE5OX0.HMkG2EDetHiGaSQJnA_axX7PBRNxShtf8lxBhuaM7sE"},
    {name = "Hela Nada Radio", url = "https://stream-176.zeno.fm/9ndoyrsujwpvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI5bmRveXJzdWp3cHZ2IiwiaG9zdCI6InN0cmVhbS0xNzYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ii1sWHNFQ002UVUtRThqMFRLUUZXZGciLCJpYXQiOjE3MjQ4NDQ1MzIsImV4cCI6MTcyNDg0NDU5Mn0.xmZFwmEiCDsiZEi62vS6luYdPzrfnz3m0mOP5rvcgpc"},
    {name = "Freefmlk", url = "https://stream-155.zeno.fm/1tcs4fbw7rquv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIxdGNzNGZidzdycXV2IiwiaG9zdCI6InN0cmVhbS0xNTUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkQxTEhGMUlJVGxDZm9ySTEwX3hZdnciLCJpYXQiOjE3MjQ4MzEwOTgsImV4cCI6MTcyNDgzMTE1OH0.0dLoZtKyac6_ZBSV5_QGkyQf0BAwjx1PQz0dlJEsFqs"},
    {name = "PRIME Radio HD", url = "https://stream-153.zeno.fm/oksfm5djcfxvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJva3NmbTVkamNmeHZ2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ik96X2RjVkpUU0x1T3JDMVZXODBMVGciLCJpYXQiOjE3MjQ4NDIxMjEsImV4cCI6MTcyNDg0MjE4MX0.tFGVJgJVWR4o4JRJwEI8-CuVWAT3ncyatn4Q7vW6rt4"},
    {name = "WIDE Radio Sri Lanka", url = "https://stream-171.zeno.fm/bhpjane61gbvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJiaHBqYW5lNjFnYnZ2IiwiaG9zdCI6InN0cmVhbS0xNzEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Im5LeGtMdTlZVGZPSUNnR2hIWW90cnciLCJpYXQiOjE3MjQ4NTAzMDUsImV4cCI6MTcyNDg1MDM2NX0.zB1oKcJmI6WG9hIaork-6IopldOAV0YTo8rnDz4uoBc"},
    {name = "Bee FM", url = "https://stream-153.zeno.fm/b5z4bwe91rhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJiNXo0YndlOTFyaHZ2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjNmVWkxaFdQUUsyNTZFSVVqWjdPdlEiLCJpYXQiOjE3MjQ4MTAyMzgsImV4cCI6MTcyNDgxMDI5OH0.hQ3gxSWg78e_z6TZFemPFX1y1k4E6aYPmZXybc1x0RU"},
    {name = "தமிழீழ வானொலி -​ Tamil​ Eelam Radio North​ ​ East​", url = "http://stream-166.zeno.fm/c6mgmtfg8e9uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJjNm1nbXRmZzhlOXV2IiwiaG9zdCI6InN0cmVhbS0xNjYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjhaWWZnZEdsVEdDdTZyZmFmUS1OV3ciLCJpYXQiOjE3MjQ4NDk1ODEsImV4cCI6MTcyNDg0OTY0MX0.7LZ68XZijA_T7ndVB3hIWM6V0HmE-WERWtPL_Ms00Jk"},
    {name = "SLBC Tamil National Service", url = "https://stream-158.zeno.fm/xekhrn4zetzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ4ZWtocm40emV0enV2IiwiaG9zdCI6InN0cmVhbS0xNTguemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InR1RjNNT3ZTUUpHdHNSTjg2UXFyOVEiLCJpYXQiOjE3MjQ4MzYyMDIsImV4cCI6MTcyNDgzNjI2Mn0.1gd17FNZ7umLpbGmyiWLVo8q2DczH7VZyaHm5VUgtGQ"},
    {name = "HITZ Fm 24", url = "https://stream-175.zeno.fm/uyx7eqengijtv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ1eXg3ZXFlbmdpanR2IiwiaG9zdCI6InN0cmVhbS0xNzUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InVOSUtpaFVGUU5lSUJGRzIwY0ZrU0EiLCJpYXQiOjE3MjQ4NDQ1MjMsImV4cCI6MTcyNDg0NDU4M30.IxreNG-GwJA_YqsgUgASRtlFeKhDNEiU3nJ2f08La_8"},
}

return stations
