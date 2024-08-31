local stations = {
    {name = "Primera 881", url = "http://stream.radiojar.com/5705c71sn2zuv"},
    {name = "Salsa - Dominicana", url = "http://radio.domiplay.net:2002/;"},
    {name = "Radio Bachata", url = "http://perseus.shoutca.st:8312/;stream/1"},
    {name = "Tres Patines Radio", url = "https://stream-52.zeno.fm/e5m3ts0vnwzuv?zs=A-8pY8fhQVeP2__LoB8bZQ"},
    {name = "Disco 106", url = "http://rss4.domint.net:8050/stream/1/"},
    {name = "Bachata Radio", url = "http://radio.domiplay.net:8002/;"},
    {name = "Fuego 90 - La Salsera", url = "https://radio5.domint.net:8110/stream"},
    {name = "Top Merengue Radio", url = "https://radio.dominiserver.com/proxy/topmerengueradio?mp=/stream"},
    {name = "Alofoke FM", url = "https://radio5.domint.net:8222/stream"},
    {name = "Top Bachata Radio", url = "https://radio.dominiserver.com/proxy/topbachata?mp=/stream"},
    {name = "Tropical 100 Salsa", url = "https://stream-107.zeno.fm/cjgfujr8yhbvv?zs=VsqKiPTASc-XIz7P9HnYjQ"},
    {name = "La Bakana 1057 FM", url = "https://radio4.domint.net:8030/stream"},
    {name = "ZTV AUDIO Z101", url = "https://radio.gmsiptv.com/ztv"},
    {name = "Salsa 927 FM", url = "https://stream.zeno.fm/h7lnwv51bh5uv"},
    {name = "HIJB 830 AM RD", url = "https://radios.xumcast.live/proxy/hijbplay/live"},
    {name = "Top Latina", url = "https://radio3.domint.net:8094/stream"},
    {name = "Latina 104", url = "https://radio.dominiserver.com/proxy/latina104?mp=/stream"},
    {name = "Radio Alma Cristiana", url = "http://stream.zeno.fm/whc88qnppyduv"},
    {name = "Fieramix", url = "https://c11.radioboss.fm:18269/stream"},
    {name = "Top Salsa Radio", url = "https://radio.dominiserver.com/proxy/topsalsaradio?mp=/stream"},
    {name = "Dominicana FM 989 Y 999 FM", url = "https://protvradiostream.com:8610/;"},
    {name = "Top Cristiano Radio", url = "https://radio.dominiserver.com/proxy/topcristianoradio?mp=/stream"},
    {name = "Super K 1007 FM", url = "https://stream-144.zeno.fm/7xnmbku8na0uv?zs=WeNbP6cZT3u4TgvRNSxcJA"},
    {name = "Ecodebendición", url = "https://stream.zeno.fm/d5gahvz0rxhvv"},
    {name = "Zol FM", url = "https://ss3.domint.net:3108/zol_str/vzol/chunklist_w1811974493.m3u8"},
    {name = "Disco 89 889 FM", url = "https://rgradio.net/disco89/disco89.mp3"},
    {name = "La Bakana 1059 FM", url = "https://radio4.domint.net:8028/stream"},
    {name = "Cosmos FM 991", url = "https://radio4.domint.net:8104/stream"},
    {name = "Renuevo FM", url = "https://radio3.domint.net:8116/stream"},
    {name = "Basto Studio Salsa", url = "http://65.21.163.60:5618/stream"},
    {name = "Escape FM 889", url = "https://radio4.domint.net:8094/stream"},
    {name = "Platino Radio", url = "https://platinoradio-henrsosa.radioca.st/stream"},
    {name = "KQ 945", url = "http://radio.yaservers.com:9990/;"},
    {name = "Escandalo 1025 FM", url = "https://rss3.domint.net:8028/stream"},
    {name = "Radio Bendicion", url = "https://samuel.i-radio.co:9000/radiobendicion"},
    {name = "Amor FM 919", url = "http://radio.domiplay.net:9190/;"},
    {name = "Exa FM República Dominicana - 969 FM - HIK52 - Santo Domingo, República Dominicana", url = "https://s2.free-shoutcast.com/stream/18258"},
    {name = "RD 700Am Radio Gosen", url = "https://s5.radio.co/sfc2826e6e/listen"},
    {name = "Top Balada Radio", url = "https://radio.dominiserver.com/proxy/topbaladaradio?mp=/stream"},
    {name = "Independencia FM", url = "http://stream.grupotelemicro.com:9303/;stream.mp3"},
    {name = "Air Romana Radio", url = "https://stream.radiojar.com/4ggz3rkd838uv"},
    {name = "Radio Universal 650AM RD", url = "https://cento01.mipanelradio.com/proxy/hetorres?mp=/stream"},
    {name = "Radio Eternidad", url = "https://cast5.my-control-panel.com/proxy/radioete/stream?type=.mp3?ver=286200"},
    {name = "Enamorada 999 FM", url = "https://rs5.domint.net:8188/stream"},
    {name = "HIJB 830 AM", url = "http://radios.xumcast.live/proxy/hijbplay/live"},
    {name = "Azúcar 891 FM", url = "https://visual.alexmer.com:8068/stream"},
    {name = "Arca De Salvación", url = "https://stream.zeno.fm/xmv0g0ztvneuv"},
    {name = "La Vaina Hits", url = "https://chokostream.net/listen/lavainahits/live"},
    {name = "Radio VEN RD", url = "https://streaming.serveraudio.net/stream/radioven1055"},
    {name = "Radio Santa Maria", url = "https://paginas.moisespaulino.com/proxy/rsantamaria/stream?type=.mp3"},
    {name = "570 AM Radio Crystal", url = "https://stream.zeno.fm/fu9hfhw8na0uv"},
    {name = "710 AM Radio Nacional Cristiana RD", url = "https://node-09.zeno.fm/03yn1w98swzuv"},
    {name = "810 AM Radio Salvación Internacional RD", url = "http://ph1.ministeriotv.com:8031/salvacion.mp3"},
    {name = "Turbo 983 FM", url = "https://cdn-embed.tunein.com/resources/media/blank.mp3"},
    {name = "Radio Fm103 RD", url = "https://radio.radiord.net/8008/;stream.mp3"},
    {name = "Power FM Santo Domingo", url = "https://radio4.domint.net:8096/stream"},
    {name = "Escala FM 1063", url = "https://radio4.domint.net:8102/stream"},
    {name = "Festival FM 903", url = "https://stream.zeno.fm/g0xb347pu4zuv"},
    {name = "Bendicion951 FM", url = "https://sp.unoredcdn.net/8054/stream"},
    {name = "Caricias FM", url = "https://streamfgh.com:8915/;"},
    {name = "Radio Plenitud Total", url = "https://server09.tuneinhd.com//8070/stream"},
    {name = "Estelar-106", url = "https://radio.dominiserver.com/proxy/estelar106?mp=/stream"},
    {name = "Naranjo Dulce Radio", url = "https://servidor37-2.brlogic.com:8518/live?source=website"},
    {name = "Top Latina 1017", url = "https://rss3.domint.net:8094/stream"},
    {name = "Azul Radio", url = "http://radio.domiplay.net:9300/;"},
    {name = "Digital 887", url = "https://stream.zeno.fm/p3syzku4ydstv"},
    {name = "Comando 88 FM Santiago", url = "http://rgradio.net:8044/comando88"},
    {name = "Ritmo 965 FM", url = "https://stream-49.zeno.fm/y0br5ck4ququv?zs=2R5Njz6XShSzNF_ProbdIA"},
    {name = "Exaltacionfm", url = "https://chokostream.net/listen/exaltacionfm/live"},
    {name = "Oyelaradiocom", url = "https://radio5.domint.net:8166/stream"},
    {name = "Radio Dial 670 AM RD", url = "https://node-08.zeno.fm/8wgv914262quv"},
    {name = "Bonche 899 FM", url = "http://a1.asurahosting.com:9470/stream"},
    {name = "Orbit TV", url = "https://ss3.domint.net:3134/otv_str/orbittv/playlist.m3u8?PlaylistM3UCL"},
    {name = "La Luz 887 Fmhigüey, Rep Dom", url = "https://radio.gmsiptv.com/laluzfm"},
    {name = "Aurora Radio 899 FM", url = "https://radio4.domint.net:8026/stream"},
    {name = "Caliente FM 1041", url = "https://rs5.domint.net:8064/stream"},
    {name = "Top Urbano", url = "https://radio.dominiserver.com/proxy/topurbano?mp=/stream"},
    {name = "Fidelity 941 FM", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/FIDELITYAAC.aac"},
    {name = "Estrella 923 FM", url = "https://c13.radioboss.fm:18187/stream"},
    {name = "La Rocka 917", url = "http://5.135.183.124:8243/"},
    {name = "Misionerafm", url = "https://radio.gmsiptv.com/misionera"},
    {name = "Tropical 100 Bolero", url = "https://stream.zeno.fm/b34hotasejstv"},
    {name = "Rumba 985 FM", url = "https://radio5.domint.net:8226/stream"},
    {name = "Canal 1051 FM", url = "https://stream.zeno.fm/b94afcu8na0uv"},
    {name = "Radio Cimarrona", url = "http://radiocimarrona.out.airtime.pro:8000/radiocimarrona_a"},
    {name = "Especial 935 FM", url = "https://stream.zeno.fm/uhkv3smxuchvv"},
    {name = "Moca FM", url = "https://rgradio.net/mocafm/mocafm"},
    {name = "Ritmo Hits", url = "https://chokostream.net/listen/ritmohits/live"},
    {name = "Kool 1069 Punta Cana", url = "https://radio.gmsiptv.com/kool"},
    {name = "Artistas Del Ayer", url = "https://streamfgh.com:8285/;"},
    {name = "La Voz Del Pacoredo", url = "https://stream-50.zeno.fm/9zxyvh9vrhruv"},
    {name = "Monumental 1003 FM", url = "https://radio2.grupointernet.com/8103/stream"},
    {name = "Bravisima Fm", url = "http://radio.hostlagarto.com/9924/stream"},
    {name = "CDN Radio", url = "https://play.cdnradio.com.do/cdnlive"},
    {name = "Mortal - 1049", url = "http://n0a.radiojar.com/x84tcy2wm2zuv?rj-ttl=5&rj-tok=AAABdbTTr_MAZACbQl_85B5uJg"},
    {name = "La 91", url = "https://radio4.domint.net:8098/stream"},
    {name = "Tropical 100 Mix", url = "https://stream-107.zeno.fm/esgo1lafgtstv?zs=o1G7UIERS3Gdtn2B7Jdt7Q"},
    {name = "Estación 977 FM", url = "https://stream2.rcast.net/61187"},
    {name = "Ser Mejor Radio", url = "http://ca2.rcast.net:8068/;stream.mp3"},
    {name = "Cibaeña FM", url = "https://stream.zeno.fm/3kasxrwxxypvv"},
    {name = "Concierto 931 FM", url = "https://rss3.domint.net:8096/stream"},
    {name = "COCO RADIO", url = "https://radio4.domint.net:9024/stream"},
    {name = "Mi 979 FM", url = "https://radio4.domint.net:8100/stream"},
    {name = "Misioneltv", url = "https://stream.zeno.fm/v2nn7w0rcq8uv"},
    {name = "Miss 104 FM", url = "https://radio.dominiserver.com/proxy/miss104fm?mp=/stream"},
    {name = "GMS", url = "https://radio.gmsiptv.com/gms"},
    {name = "ESTUDIO 979 FM", url = "http://paginas.moisespaulino.com:8067/stream"},
    {name = "Super K FM", url = "https://grupomedrano.stream-audio.com:8856/SuperK"},
    {name = "RADIO FANTASIA 905 FM", url = "https://stream.zeno.fm/bvxytsvce78uv"},
    {name = "I Love Tipico Radio", url = "http://ilovetipico.com.do/radio.m3u"},
    {name = "RD CDN37", url = "https://ssh101.bozztv.com/ssh101/rctvhd102/icecast.audio"},
    {name = "Bani Fm 975", url = "https://stream.zeno.fm/3fdfdb8g0hhvv"},
    {name = "Misionera FM", url = "https://stream.zeno.fm/vget1nz0czxvv"},
    {name = "Criolla 1061 FM", url = "https://streaming.grupomediosdelnorte.com:8002/stream"},
}

return stations
