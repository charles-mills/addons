local stations = {
    {name = "Anime Para Ti", url = "https://stream.zeno.fm/qpn8mkt8c4duv"},
    {name = "Free FM 80 Tokyo", url = "https://freefm80.radioca.st/"},
    {name = "BOX : Japan City Pop -日本のシティポップ", url = "https://play.streamafrica.net/JapanCityPop"},
    {name = "Jazz Sakura Asia Dream Radio", url = "http://kathy.torontocast.com:3330/stream/1/?esPlayer&cb=82181.mp3"},
    {name = "Radio", url = "https://relay0.r-a-d.io/main.mp3"},
    {name = "Tokyo Rose Radio", url = "http://bluford.torontocast.com:8006/stream"},
    {name = "Asia DREAM Radio - Japan Hits", url = "https://cast1.torontocast.com:2120/stream"},
    {name = "Retro PC GAME MUSIC Streaming Radio", url = "http://gyusyabu.ddo.jp:8000/listen.pls"},
    {name = "J-Pop Sakura 懐かしい Asia DREAM Radio", url = "https://cast1.torontocast.com:2170/;.mp3"},
    {name = "Stereoanime", url = "https://radio.stereoanime.net/listen/stereoanime/128"},
    {name = "Shonan Beach FM 789", url = "http://shonanbeachfm.out.airtime.pro:8000/shonanbeachfm_a"},
    {name = "FM世田谷", url = "https://fmsetagaya834.out.airtime.pro/fmsetagaya834_a"},
    {name = "J1 HITS", url = "https://jenny.torontocast.com:2000/stream/J1HITS?_=184325"},
    {name = "Big B Radio - Jpop", url = "https://antares.dribbcast.com/proxy/jpop?mp=/s"},
    {name = "Free FM Tokyo", url = "https://rocafmadrid.radioca.st/"},
    {name = "Kishiwada Radio", url = "http://61.89.201.27:8000/radikishi.mp3"},
    {name = "Moon Mission Recordings", url = "http://www.internet-radio.com/servers/tools/playlistgenerator/?u=http://uk5.internet-radio.com:8306/listen.pls&t=.m3u"},
    {name = "AFN GO TOKYO", url = "http://playerservices.streamtheworld.com/m3u/AFNP_TKO.m3u"},
    {name = "J-Pop Powerplay Kawaii", url = "https://kathy.torontocast.com:3060/;"},
    {name = "FM Kahoku 787 FMかほく, JOZZ5AM-FM, 787 Mhz, Kahoku City, Ishikawa", url = "http://radio.kahoku.net:8000/;"},
    {name = "Fred Film Radio日本語", url = "https://s10.webradio-hosting.com/proxy/fredradiojp/stream"},
    {name = "Japan Hits", url = "http://cast1.torontocast.com/JapanHits"},
    {name = "Ashiyaradio〜アシヤ・ラヂヲ〜", url = "https://s3.radio.co/sc8d895604/listen"},
    {name = "J1 Gold HTTP", url = "http://jenny.torontocast.com:8062/"},
    {name = "J-Pop Sakura Natsukashii", url = "https://cast1.torontocast.com:2170/;"},
    {name = "Tatsuro Yamashita Radio", url = "https://stream.zeno.fm/p83d0vdp54zuv"},
    {name = "Rainwave All", url = "https://relay.rainwave.cc/all.mp3?1:MF0d8GHw2d"},
    {name = "Vocaloid Radio", url = "http://curiosity.shoutca.st:8019/128"},
    {name = "Quran", url = "https://backup.qurango.net/radio/ahmad_khader_altarabulsi"},
    {name = "#Radio Quran", url = "https://n0a.radiojar.com/0tpy1h0kxtzuv?rj-ttl=5&rj-tok=AAABhdgGORQA-2acfyF3_4WY2g"},
    {name = "ALR Jazz Radio", url = "http://radio30.virtualtronics.com:2199/tunein/abaco-stream.pls"},
    {name = "Ottava", url = "http://ottava2.out.airtime.pro:8000/ottava2_a"},
    {name = "Real Love Music - Radio Future Funk", url = "https://stream-152.zeno.fm/48533y95cnruv?zs=doyTUcjfTvCVtBOS3nlI8g"},
    {name = "Onlyhits Japan", url = "https://j.onlyhit.us/play"},
    {name = "J-POP Powerplay", url = "https://kathy.torontocast.com:3560/"},
    {name = "Gotanno Radio 892", url = "https://gotanno.love:8443/;"},
    {name = "WREP", url = "http://c13.radioboss.fm:8200/stream"},
    {name = "Shonan Beach FM", url = "http://150.95.174.29:8000/by_the_sea"},
    {name = "J1 Hits HTTP", url = "http://jenny.torontocast.com:8056/"},
    {name = "羊飼いラジオHitsujikai Radio Shepherd Radio", url = "https://streaming.radio.co/se4a8e6a93/low"},
    {name = "Patchwork Archive - Vtuber Songs And Covers", url = "https://a4.asurahosting.com/public/patchworkarchive/playlist.m3u"},
    {name = "Nightwave Plaza MP3 182", url = "http://radio.plaza.one/mp3"},
    {name = "Friends Forever 128Kbps MP3", url = "https://s5.radio.co/s6140c7241/listen"},
    {name = "Listenmoe J-Pop MP3", url = "https://listen.moe/fallback"},
    {name = "SOUND UP STATION NFRS", url = "https://stream2.rcast.net/70945"},
    {name = "J-Pop Sakura", url = "https://cast1.torontocast.com:2170/stream"},
    {name = "BOOTY FM", url = "http://60.45.66.12:88/bootyfm"},
    {name = "Opening Radio", url = "http://stream.zeno.fm/tza2ayy47qruv"},
    {name = "Súper Tokio Radio", url = "https://streamer.radio.co/s83eb8ff39/listen"},
    {name = "Friends Forever 64Kbps AAC", url = "https://s5.radio.co/s6140c7241/low"},
    {name = "Kyotouriverside From Riverside Of Yura River In Kyoto University Ashiu Research Forest Miyama, Kyoto", url = "http://locus.creacast.com:9001/kyoto_cyberforesthydro.mp3"},
    {name = "Jazz Sakura", url = "https://kathy.torontocast.com:3330/;"},
    {name = "Jpopsuki Radio", url = "http://jpopsuki.fm:2199/tunein/jpopsuki-stream.pls"},
    {name = "J-Pop Powerplay Kawaiiasia Dream Radio", url = "https://kathy.torontocast.com:3060/;?shoutcast"},
    {name = "J-Club Club Bandstand", url = "https://cast1.torontocast.com:2060/;.mp3"},
    {name = "BOX : J-POP RADIO - ジェイポップ", url = "https://boxradio-edge-07.streamafrica.net/jpop"},
    {name = "J-Rock Powerplayasia DREAM Radio", url = "https://kathy.torontocast.com:3340/;?shoutcast"},
    {name = "J1 XTRA HTTP", url = "http://jenny.torontocast.com:8058/"},
    {name = "Hitsujikai Radio", url = "http://streaming.radio.co/se4a8e6a93/listen"},
    {name = "Voice Of The Planet Ottava", url = "http://voiceoftheplanet.out.airtime.pro:8000/voiceoftheplanet_a"},
    {name = "J-Rock Powerplay", url = "https://kathy.torontocast.com:3340/stream"},
    {name = "J-Club Powerplay Hiphopasia DREAM Radio", url = "https://kathy.torontocast.com:3350/;?shoutcast"},
    {name = "WVVV V969", url = "https://ice5.securenetsystems.net/WVVVFM"},
    {name = "Jphip Radio", url = "http://radio.jphip.com:8800/listen.pls"},
    {name = "Otohama Coastal Soundscape From The University Of Tokyo International Coastal Research Center Otsuchi, Iwate", url = "http://mp3s.nc.u-tokyo.ac.jp/OTSUCHI_CyberForest.mp3"},
    {name = "J-Club Powerplay Hiphop", url = "https://kathy.torontocast.com:3350/;"},
    {name = "Yamanakako From Fuji Iyashinomori Woodland Study Center, The University Of Tokyo Forests Yamanakako, Yamanashi", url = "http://mp3s.nc.u-tokyo.ac.jp/Fuji_CyberForest.mp3"},
    {name = "Otaku Music Radio", url = "https://kathy.torontocast.com:2880/;?type=http&nocache=1606748882"},
}

return stations
