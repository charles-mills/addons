local stations = {
    {name = "1 Rock Bulgaria", url = "http://31.13.223.148:8000/1_rock.mp3"},
    {name = "ARHEA ORG", url = "http://stream.zeno.fm/na6nbx6qqwzuv"},
    {name = "Avto Radio", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/AVTORADIOAAC_L.aac"},
    {name = "Avtoradio", url = "https://25693.live.streamtheworld.com/AVTORADIOAAC_L.aac?dist=onlineradiobox"},
    {name = "Bad Rock Radio 1", url = "https://play-radio0.jump.bg:7028/live"},
    {name = "Badrock Classic Rock", url = "https://play-radio0.jump.bg:7489/live"},
    {name = "Badrock Hard Heavy", url = "https://play-radio0.jump.bg:7049/live"},
    {name = "Badrock Radio National", url = "https://radiocp.jump.bg/proxy/stan1?mp=/live"},
    {name = "Bar Friends Pernik", url = "http://79.98.108.170:8278/autodj"},
    {name = "Bg Estrada", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/BG_ESTRADAAAC_L.aac?dist=onlineradiobox"},
    {name = "BG Radio", url = "http://stream.radioreklama.bg/bgradio128"},
    {name = "BNR - Hristo Botev", url = "http://stream.bnr.bg:8012/hristo-botev.aac"},
    {name = "BNR Radio Shumen", url = "http://stream.bnr.bg:8033/radio-shumen.aac"},
    {name = "BNR Sofia High", url = "http://stream.bnr.bg:8030/radio-sofia.aac"},
    {name = "BNR Stara Zagora", url = "http://82.103.99.99:8000/radiosz"},
    {name = "BNR Varna", url = "http://broadcast.masters.bg:8000/live"},
    {name = "Btv Radio", url = "https://cdn.bweb.bg/radio/btv-radio.mp3"},
    {name = "Bumerang FM", url = "http://www.bumerangfm.net/BumerangFM.m3u"},
    {name = "Casino Web Radio", url = "http://79.98.108.170:8026/live"},
    {name = "Cherveniat Papagal", url = "https://stream-64.zeno.fm/80qzq207rm0uv?zs=_xFVUn2nS3qDiPZ-lCCmIQ"},
    {name = "City Bulgaria", url = "http://31.13.223.148:8000/city.mp3"},
    {name = "Classic FM 880", url = "https://bravo.btv.bg/radio/classic-radio-proxy/"},
    {name = "Coda Radio By Metropolis", url = "https://metropolis.bg:8443/codaradio"},
    {name = "Dan Pen Radio", url = "https://server.danpenradio.net/listen/danpen_radio/radio.mp3"},
    {name = "Dance With Me", url = "http://g5.turbohost.eu:8002/stream320"},
    {name = "DARIK", url = "https://darikradio.by.host.bg:8000/S2-128"},
    {name = "Darik Nostalgie", url = "https://darikradio.by.host.bg:8000/Nostalgie"},
    {name = "Deep Lounge", url = "https://radio.jump.bg/proxy/georgi18/stream"},
    {name = "Deep Radio Europe", url = "http://79.98.108.174:8000/stream"},
    {name = "DJ Zone House", url = "http://162.244.80.106:11181/stream"},
    {name = "Easyradio", url = "https://easyradio.bg/m3u/easyradio.bg-aac.m3u"},
    {name = "Eilo Radio - Progressive Radio", url = "https://opml.radiotime.com/Tune.ashx?id=s214979"},
    {name = "Energy Bulgaria", url = "http://149.13.0.80/nrj128"},
    {name = "Extreme Deep House", url = "http://whsh4u-panel.com:14113/stream"},
    {name = "Extreme Deep House Radio", url = "https://whsh4u-panel.com/proxy/yfryujzw/stream"},
    {name = "FM +", url = "http://193.108.24.21:8000/fmplus"},
    {name = "Focus", url = "https://focusradio.dataserv.cc/1"},
    {name = "Folk Mix", url = "https://listen.radiofolkmix.com/folkmixios"},
    {name = "Fred Film Radioбългарски Език", url = "https://s10.webradio-hosting.com/proxy/fredradiobg/stream"},
    {name = "Fresh", url = "http://193.108.24.21:8000/fresh"},
    {name = "Fresh Bulgaria", url = "http://31.13.223.148:8000/fresh.mp3"},
    {name = "Hot Hits FM", url = "https://live.hothitsfm.com/stream"},
    {name = "Jazz FM", url = "https://cdn.bweb.bg/radio/jazz-fm.mp3"},
    {name = "KATRA FM", url = "http://www.katrafm.com:8000/live"},
    {name = "Lele Male", url = "http://79.98.108.170:8332/;"},
    {name = "Luxor Web Radio", url = "http://79.98.108.170:8078/autodj"},
    {name = "Maxx FM Bulgaria", url = "https://play.radiomaxxfm.com/maxx-lo"},
    {name = "Metro Country Rock", url = "https://eu1.reliastream.com/proxy/feedb?mp=/CRR64"},
    {name = "Metro DANCE Radio", url = "https://eu1.reliastream.com/proxy/mdr?mp=/MDR"},
    {name = "Metro HITS Radio", url = "https://eu1.reliastream.com/proxy/mhr?mp=/MHR"},
    {name = "Metro Love 00S", url = "https://eu1.reliastream.com/proxy/metroplusc?mp=/MLR2K"},
    {name = "Metro Love 80S", url = "https://eu1.reliastream.com/proxy/love80?mp=/MLR80S"},
    {name = "Metro Love 90S Plus", url = "https://eu1.reliastream.com/proxy/love80?mp=/MLR90S"},
    {name = "Metro Love Hits", url = "https://eu1.reliastream.com/proxy/service?mp=/service"},
    {name = "Metro Top Radio", url = "https://eu1.reliastream.com/proxy/mgr?mp=/MGR"},
    {name = "Metro Urban Hits", url = "https://eu1.reliastream.com/proxy/metroxmas?mp=/MCR"},
    {name = "Metro Virtuoso Hits", url = "https://eu1.reliastream.com/proxy/mvr?mp=/MVR"},
    {name = "Mixx", url = "http://83.97.65.98:9000/listen.pls"},
    {name = "NJOY Summer Mood", url = "https://bravo.btv.bg/radio/njoy-radio-proxy/index.php"},
    {name = "NJS Radio - New Jack Swing", url = "http://162.244.80.106:11198/"},
    {name = "Note FM", url = "http://stream.zeno.fm/rvw1h2zk7s8uv"},
    {name = "Note Party", url = "http://stream.zeno.fm/ux3k5mabt18uv"},
    {name = "Nova Bulgaria", url = "http://31.13.223.148:8000/nova.mp3"},
    {name = "Nova News", url = "http://stream.radioreklama.bg/novanews.aac"},
    {name = "Online DJ Radio 64", url = "http://play-radio11.jump.bg:8000/stream64_autodj"},
    {name = "Onlinedjradio", url = "https://play.onlinedjradio.com:7000/live"},
    {name = "Radio 1", url = "http://stream.metacast.eu/radio1128"},
    {name = "Radio 1 Rock", url = "https://25643.live.streamtheworld.com/RADIO_1_ROCKAAC_H.aac?dist=DESKTOP"},
    {name = "Radio 1 Радио 1 Класическите Хитове", url = "http://stream.radioreklama.bg/radio164"},
    {name = "Radio 999", url = "http://62.204.158.5:8081/live"},
    {name = "Radio AXE Project", url = "http://79.98.108.170:8004/autodj"},
    {name = "Radio Beatport", url = "http://79.98.108.170:8014/autodj"},
    {name = "Radio Beinsa Duno", url = "http://87.252.182.193:8000/;"},
    {name = "Radio BG London Plus", url = "http://live.radiobg.co.uk:8000/live"},
    {name = "Radio Bojia Sila", url = "https://stream-51.zeno.fm/6t0ec6rwtuquv?zs=DBLwfgNCS6Kch-7j_O2z2A"},
    {name = "RADIO CITY", url = "http://play.global.audio/city64"},
    {name = "Radio Contact", url = "https://listen.radioking.com/radio/490082/stream/546899"},
    {name = "Radio Deep Disco", url = "http://79.98.108.170:8000/autodj"},
    {name = "Radio Dobrudja", url = "http://5.104.174.128:8000/radiodobrudja"},
    {name = "Radio El Shada", url = "https://stream-40.zeno.fm/hku46gxdexquv?zs=d8gnzJrzS0GpfjuXp_Lx_Q"},
    {name = "Radio Family", url = "http://a1.virtualradio.eu:8000/family.mp3"},
    {name = "Radio Favorit", url = "http://79.98.108.170:8235/listen.pls"},
    {name = "Radio Folk Convert", url = "http://79.98.108.170:8039/autodj"},
    {name = "Radio Fresh", url = "http://193.108.24.21:8000/fresh.m3u"},
    {name = "Radio Gamma", url = "http://g5.turbohost.eu:8003/gama128"},
    {name = "Radio Globe", url = "http://79.98.108.170:8019/autodj"},
    {name = "Radio Helikon", url = "http://87.121.90.229:9000/live_128"},
    {name = "Radio Horo Plus", url = "http://g5.turbohost.eu:8020/stream256"},
    {name = "Radio Hotel Olimp", url = "http://79.98.108.170:8048/autodj"},
    {name = "Radio Hushove", url = "http://79.98.108.173:8006/radioxaschove"},
    {name = "Radio Jega Жега", url = "http://g5.turbohost.eu:8004/stream"},
    {name = "Radio Jugomania", url = "https://s8.yesstreaming.net:17051/autodj"},
    {name = "Radio Kesarevo", url = "https://ssl22.radyotelekom.com/8136/stream"},
    {name = "Radio Lagoshevtsi", url = "http://radio.jump.bg:8484/stream"},
    {name = "Radio Maia", url = "http://radiomaia.com/player/index.php?pl=winamp&c=%D0%A0%D0%B0%D0%B4%D0%B8%D0%BE%20%D0%9C%D0%B0%D1%8F%20%D0%91%D1%83%D1%80%D0%B3%D0%B0%D1%81"},
    {name = "Radio Mall Sofia", url = "http://79.98.108.170:8104/autodj"},
    {name = "Radio Melodia Silistra", url = "http://g5.turbohost.eu:8010/stream128"},
    {name = "Radio Melody", url = "http://193.108.24.6:8000/melody?file=.mp3"},
    {name = "Radio Metronom", url = "http://radiometronom.com:8010/"},
    {name = "Radio Music BG", url = "http://79.98.108.170:8243/listen.pls"},
    {name = "Radio N-Joy Bulgaria", url = "https://bravo.btv.bg/radio/njoy-radio-proxy/"},
    {name = "Radio Nostalgia", url = "http://stream.zeno.fm/bfkspxrh4zhvv"},
    {name = "Radio Nova News", url = "https://25693.live.streamtheworld.com/RADIO_NOVANEWSAAC_L.aac"},
    {name = "Radio Nova Zagora", url = "http://80.253.48.162:8090/nova.mp3"},
    {name = "Radio ORV", url = "http://radio.orvmedia.com:8005/stream"},
    {name = "Radio Oxfm", url = "http://65.109.88.81:7350/"},
    {name = "Radio Pianica", url = "http://mpc1.mediacp.eu:8024/listen.pls"},
    {name = "Radio QFT", url = "https://qft.monster/listen/radio_qfte/radio.mp3"},
    {name = "Radio Razgrad", url = "http://188.126.1.25:8000/razgrad"},
    {name = "Radio Retro Folk", url = "http://79.98.108.170:8053/"},
    {name = "Radio Rezonans", url = "http://88.87.10.53:8000/*.ogg"},
    {name = "Radio Rila Folk", url = "http://79.98.108.176:8016/;"},
    {name = "Radio Rock And Blues", url = "http://79.98.108.170:8029/autodj"},
    {name = "Radio Sladko Izkushenie", url = "http://g5.turbohost.eu:8006/autodj"},
    {name = "Radio Slavianska Parodia", url = "http://79.98.108.170:8033/autodj"},
    {name = "Radio Strimonika", url = "https://play-radio0.jump.bg:7666/stream"},
    {name = "Radio Sunny Beach", url = "https://sunny-beachradio.stream.laut.fm/sunny-beachradio"},
    {name = "Radio Teteven", url = "http://g5.turbohost.eu:8001/teteven"},
    {name = "Radio Tomeko", url = "http://79.98.108.170:8024/live"},
    {name = "Radio Usmivka", url = "http://79.98.108.170:8025/stream"},
    {name = "Radio Vega +", url = "http://88.80.96.25:3050/;?1705023133784"},
    {name = "Radio Vega Plus", url = "http://88.80.96.25:40070/vega.mp3"},
    {name = "Radio Venseremos", url = "https://listen7.myradio24.com/venceremos"},
    {name = "Radio Winbet", url = "http://79.98.108.170:8010/autodj"},
    {name = "Radio Z-Rock Bulgaria", url = "https://bravo.btv.bg/radio/zrock-radio-proxy/"},
    {name = "Radio Zone Mix", url = "http://79.98.108.170:8036/autodj"},
    {name = "Radio Zorana Sofia", url = "https://radio.jump.bg/proxy/radio12/stream"},
    {name = "Raimos Disco Radio", url = "http://a1.virtualradio.eu:8000/discoradio"},
    {name = "Raimos Hits Radio", url = "http://a3.virtualradio.eu:8000/pstz.mp3"},
    {name = "Raimos Rock Radio", url = "http://a1.virtualradio.eu:8000/rockradio"},
    {name = "Raimos Smooth Radio", url = "http://a3.virtualradio.eu:8000/softz.mp3"},
    {name = "Stream House Radio", url = "http://79.98.108.170:8018/autodj"},
    {name = "SWEET RADIO", url = "http://cdn.tvoetoradio.net:8000/test"},
    {name = "Tangra Mega Rock", url = "http://stream-bg-01.radiotangra.com/Tangra-high.aac"},
    {name = "Test NRJ Sergio IP", url = "http://149.13.0.80/energy-90s"},
    {name = "Traffic Radio Station", url = "http://radio.networx.bg:8000/TrafficRadio"},
    {name = "Turbo Lounge", url = "http://79.98.108.170:8115/autodj"},
    {name = "Turbo Web", url = "http://79.98.108.170:8116/autodj"},
    {name = "Tvoeto Radio", url = "http://79.98.108.173:8010/radio"},
    {name = "Ultra Blagoevgrad", url = "http://www.ultranet.biz/ultrablagoevgrad.m3u"},
    {name = "Ultra Sandanski", url = "http://88.80.96.25:8000/"},
    {name = "Vega+ Sandaski", url = "http://www.ultranet.biz/vegasandanski.m3u"},
    {name = "Vocal Mix Radio", url = "http://79.98.108.170:8015/autodj"},
    {name = "Xradyo 1", url = "https://xraydio.ddns.net/live"},
    {name = "Xraydio 2", url = "https://xraydio.ddns.net/jukebox"},
    {name = "Z-Rock Alt", url = "http://193.108.24.6:8000/zrock.m3u"},
    {name = "БНР Хоризонт", url = "http://stream.bnr.bg:8011/horizont.aac"},
    {name = "БНР – Детска Програма Детскотобнр", url = "http://stream.bnr.bg:8013/detskoto-bnr.aac"},
    {name = "БНР – Радио Благоевград", url = "http://stream.bnr.bg:8035/radio-blagoevgrad.aac"},
    {name = "БНР – Радио Бургас", url = "http://stream.bnr.bg:8037/radio-burgas.aac"},
    {name = "БНР – Радио Видин", url = "http://stream.bnr.bg:8036/radio-vidin.aac"},
    {name = "БНР – Радио Кърджали", url = "http://stream.bnr.bg:8038/radio-kardzhali.aac"},
    {name = "БНР – Радио Пловдив", url = "http://stream.bnr.bg:8032/radio-plovdiv.aac"},
    {name = "БНР – Радио Стара Загора", url = "http://stream.bnr.bg:8034/radio-stara-zagora.aac"},
    {name = "Мая", url = "http://www.rnmediagroup.com:9000/listen.pls"},
    {name = "Радио Жега 96", url = "http://g5.turbohost.eu:8004/stream96"},
    {name = "Радио Канон - Radio Kanon", url = "http://79.98.108.170:8059/stream"},
    {name = "Радио Пайнер", url = "http://87.120.6.86:8000/hq"},
    {name = "Радио Пауър ФМ - Radio Power FM", url = "http://a1.virtualradio.eu:8000/powerfm.mp3"},
    {name = "Радио Хоро", url = "http://g5.turbohost.eu:8020/stream256.m3u"},
    {name = "Радио „Епархийски Глас“", url = "https://radio.mitropolia-sofia.org:7610/stream"},
}

return stations
