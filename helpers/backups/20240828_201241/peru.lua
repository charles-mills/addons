local stations = {
    {name = "Aero Music", url = "http://stream.zeno.fm/n652n9msaq8uv"},
    {name = "Altamar Ilo", url = "https://cloudstream2030.conectarhosting.com/9380/stream"},
    {name = "Andina Radio", url = "http://panel.innovatestream.pe:7058/;"},
    {name = "Andina Radio 980 AM", url = "http://167.114.118.120:7058/;"},
    {name = "Antena Sur 903 FM", url = "https://stream.zeno.fm/tu63bf6g31zuv"},
    {name = "Asia La Extrema 1059 FM", url = "http://167.114.118.120:7678/;"},
    {name = "Asia La Radio", url = "http://167.114.118.120:7804/;"},
    {name = "Az Retro Peru", url = "https://stream.zeno.fm/v7kvqunmwzzuv"},
    {name = "Baladitas", url = "http://stream.zeno.fm/hf2gsfm1mp8uv?1649692370879"},
    {name = "Boleros Inolvidables Fmlima", url = "https://stream.zeno.fm/5t45zksv7mruv"},
    {name = "Canto Grande 977 FM", url = "https://tupanel.info:9810/stream"},
    {name = "CANTO GRANDE FM", url = "https://tupanel.info:9810/;stream.nsv"},
    {name = "Carolina FM", url = "https://turadio.accesopanel.com:7028/;"},
    {name = "Chalaca", url = "https://conectperu.com:7041/stream?icy=http"},
    {name = "Chami Radio 1040 AM", url = "https://centova.heplayer.com/proxy/stereon1/stream"},
    {name = "CJ Rad", url = "https://stream.zeno.fm/xvnzmkxzfrhtv"},
    {name = "Conexion Kpop", url = "https://centova.heplayer.com/proxy/conexion/stream"},
    {name = "Conga Blue", url = "https://radio.plhradio.com/8014/stream"},
    {name = "Corporación Radial EL - Ocalli, Luya", url = "https://stream.zeno.fm/ve5kqm6deq3vv"},
    {name = "Cuba Mania", url = "https://radio.plhradio.com/8004/stream"},
    {name = "De Amor Y Salsa", url = "https://radio.plhradio.com/8008/stream"},
    {name = "Difusora Blondy - Chachapoyas", url = "http://oyotunstream.com:7322/;stream"},
    {name = "Digital Play FM", url = "https://dpfmadmin.radioca.st/stream"},
    {name = "Doble Nueve - Classic", url = "http://149.56.241.147:8008/stream?icy=http"},
    {name = "Doble Nueve - Heritage", url = "http://149.56.241.147:8006/stream?icy=http"},
    {name = "Doble Nueve - Live", url = "http://149.56.241.147:8002/stream?icy=http"},
    {name = "Doble Nueve - Millenial", url = "http://149.56.241.147:8004/stream"},
    {name = "El Sembrador Radio 590 AM Y 1001 FM", url = "https://panel.streamenviron.com:8158/stream.mp3"},
    {name = "Electro Radio Live", url = "https://stream-142.zeno.fm/93kksqvkeg8uv?zs=N9EUqjz8RdOQAaV215SUFg"},
    {name = "Estacion 90S", url = "https://radio.livestreamingmundial.com:7041/stream"},
    {name = "Estación Alpamayo", url = "https://eu47-sonic.instainternet.com/8096/stream"},
    {name = "Estacion Satelite 1001 FM", url = "http://94.140.116.104:8000/estacion-satelite"},
    {name = "Estación Solar 1033 FM", url = "http://167.114.118.119:7330/;"},
    {name = "Estudio J 973 FM", url = "https://stream.zeno.fm/qusmdw24a48uv"},
    {name = "Exa FM", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/XHPSFMAAC.aac"},
    {name = "Fama Sur Tarata", url = "https://sp.oyotunstream.com/9326/stream"},
    {name = "Filarmonía", url = "https://c22.radioboss.fm:8100/stream"},
    {name = "Filarmonía OCR-4V, 1027 Mhz FM, Lima IRTP", url = "http://c22.radioboss.fm:8100/stream"},
    {name = "Flow Cristiano", url = "https://mediastreamm.com:8054/stream?icy=http"},
    {name = "Fmlima", url = "https://stream.zeno.fm/qotg58sxvehvv"},
    {name = "FRECUENCIA 1330 AM Parque Azangaro Miraflores LUIS ANGEL ANCON PATIÑO", url = "https://turadio.accesopanel.com/8360/stream"},
    {name = "Full Techno", url = "https://tupanel.info:8290/stream?icy=http"},
    {name = "Gen X", url = "https://turadio.accesopanel.com/8526/stream"},
    {name = "Generacion Kpop", url = "http://stream9.mexiserver.com:8242/stream"},
    {name = "Genios TV", url = "https://live.obslivestream.com/geniostvmux/index.m3u8"},
    {name = "Hisparockas", url = "https://stream.zeno.fm/nhu7v3guz08uv"},
    {name = "Jazzcontempo", url = "https://cast4.asurahosting.com/proxy/fernand4/stream"},
    {name = "JVM La Estación", url = "https://stream.laut.fm/jvmlaestacion"},
    {name = "Ke Brava", url = "https://stream.zenolive.com/59947b1wfuquv"},
    {name = "La Incontrastable Radio", url = "https://stream.zeno.fm/vkhw2yc0mfhvv"},
    {name = "La Jefa Perú", url = "http://167.114.118.119:7320/"},
    {name = "La Mejor Música Del Mundo", url = "https://stream.zeno.fm/n54r7dsxs98uv"},
    {name = "La Ñ Fmlima", url = "https://stream.zeno.fm/tk4wmqvnnnruv"},
    {name = "La Noventera", url = "https://host.gometri.com/proxy/lanoventera/stream/"},
    {name = "La Radio De Cushta Galiano", url = "http://stream.zeno.fm/z27q1ywrt98uv"},
    {name = "La Salsa Maestra", url = "https://stream.zeno.fm/c1skkw28pfeuv"},
    {name = "La Sonera Radio", url = "https://tupanel.info:8300/listen.pls?sid=1"},
    {name = "Levelhits", url = "https://radio.pjcks.com/7234/stream"},
    {name = "Mambo INN Radio", url = "https://radio.perustream.com:7000/stream"},
    {name = "Mega St☆R Peru", url = "http://stream.zeno.fm/m0gb9v7aqs8uv"},
    {name = "Melodia Arequipa", url = "http://stream.radiomelodia.com.pe:8000/radio.mp3"},
    {name = "MGR Radio Mara Gamero Dj Ethamx", url = "https://stream-154.zeno.fm/fdhacwakavkuv"},
    {name = "MI Radio Percy Altamirano Dj Ethamx", url = "https://stream-170.zeno.fm/g9afqk829ibtv"},
    {name = "Moderna Radio Papá", url = "https://radio.transmite.pe/8020/stream/;type=mp3"},
    {name = "Nueva Q", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/CRP_NQAAC.aac?csegid=1010&dist=1010&_=767257"},
    {name = "Nuevaolera", url = "https://stream.zeno.fm/4q99spjike0uv"},
    {name = "Nuevo Tiempo", url = "https://stream.live.novotempo.com/radio/smil:rntLimaPE.smil/playlist.m3u8"},
    {name = "Onda Azul", url = "https://stream-160.zeno.fm/z4xkhcavfu4uv?zs=0rAi8TrvRl2TJcd_ZGMkKA"},
    {name = "Onda Cero Te Activa", url = "https://mdstrm.com/audio/6598b65ab398c90871aff8cc/icecast.audio"},
    {name = "Onda Popular", url = "https://dattavolt.com/8278/stream?1634322652441"},
    {name = "Orbita Radio Dance", url = "http://topradio.pro:8090/autodj"},
    {name = "Ovación 620 AM", url = "https://5c3fb01839654.streamlock.net:1963/ipradioovacion1/liveovacion1radio/playlist.m3u8"},
    {name = "Panamericana Latino Refrescante", url = "https://mdstrm.com/audio/6598b76c6c07d80644b7321f/icecast.audio"},
    {name = "Panamericana Retro Rock", url = "https://mdstrm.com/audio/6598b728d982060896866b8a/icecast.audio"},
    {name = "Panamericana Salsa Power", url = "https://mdstrm.com/audio/6598b751261d9e088a6deadd/icecast.audio"},
    {name = "PBO Radio", url = "http://n06.radiojar.com/2fse67zuv8hvv?1669054401=&rj-tok=AAABhJtuNOUAIi7Le3h5PA-2VA&rj-ttl=5"},
    {name = "Peru Folk Radio", url = "https://raymistream.net/listen/perufolkradio/live"},
    {name = "Peruana Radio", url = "https://cloudstream2036.conectarhosting.com/8352/stream"},
    {name = "Perucumbiacom", url = "https://tupanel.info:8270/"},
    {name = "RADIO PLATINUM 1029 FM", url = "http://stream.zeno.fm/59sn98mhanruv.pls"},
    {name = "Radio - Congreso Del Perú", url = "https://vivo.miradio.in/8048/stream"},
    {name = "Radio 1160 Peru", url = "https://us-b4-p-e-pb13-audio.cdn.mdstrm.com/live-audio-aw/6598b6e1261d9e088a6de859?aid=658ddcc0b2c7835d48fee06d&pid=G3FnIvg2s2uxHg1lIbLUlWa3cFT5KPBg&sid=XAAefdCCMC9B9MvNg9TwqdstYTKnk3li&uid=Nkdb2uczAeFQEIGw1fojci2BEYfd4Tye&es=us-b4-p-e-pb13-audio.cdn.mdstrm.com&ote=1711464716330&ot=YgiDR9HDtOJKN3UCFo0-xg&proto=https&pz=us&cP=128000&awCollectionId=658ddcc0b2c7835d48fee06d&liveId=6598b6e1261d9e088a6de859&listenerId=Nkdb2uczAeFQEIGw1fojci2BEYfd4Tye"},
    {name = "Radio A 949", url = "https://stream.zeno.fm/qxsaiqu7pn4tv"},
    {name = "Radio Agricultura Cajamarca", url = "https://envivo.top:8443/agricultura"},
    {name = "Radio Aire", url = "https://stream-150.zeno.fm/2a2qb8z1a5zuv?zs=KCNxf0MEQ1aTZiARpyhokg"},
    {name = "Radio Alegria - La Rompe", url = "https://radio.sistemasandinos.org:10974/;stream"},
    {name = "Radio Altamar", url = "http://cloudstream2030.conectarhosting.com:9380/stream/"},
    {name = "Radio Altura Pasco, Macusani 1009 Fm", url = "http://167.114.118.120:7816/"},
    {name = "Radio Amo La Música", url = "http://stream.zeno.fm/aqmct15qmchvv"},
    {name = "Radio Andina Tarata", url = "http://sp.oyotunstream.com:8064/listen.pls"},
    {name = "Radio Antena 5 Cusco 1600 AM Más Que Una Radio", url = "https://stream.zeno.fm/pkvdsllgubgtv"},
    {name = "Radio Armonía", url = "https://radio.sistemasandinos.org:10978/;"},
    {name = "Radio Arumarka 1073 Fm Puno", url = "https://radios.sonidoshd.com/8038/;"},
    {name = "Radio Bahía 1031 FM - Pisco", url = "http://167.114.118.119:7494/;"},
    {name = "Radio Baladitas", url = "https://stream.zeno.fm/hf2gsfm1mp8uv"},
    {name = "Radio Buenaza Digital", url = "https://turadio.accesopanel.com/8486/stream"},
    {name = "Radio Caramelo", url = "https://panelautodj.innovatestream.pe:10857/stream"},
    {name = "Radio Casma", url = "https://radio.livestreamingmundial.com:7110/stream"},
    {name = "Radio Chalaca Callao", url = "https://conectperu.com/8084/stream"},
    {name = "Radio Chocolate Rock Pop", url = "https://stream.zeno.fm/g2w7ukzh64zuv"},
    {name = "Radio Ciberplus", url = "https://stream.zeno.fm/rn84grzfr2zuv/;"},
    {name = "Radio Clasica Rockpop", url = "https://sonicpanel.globalstream.pro/8042/stream"},
    {name = "Radio Comas", url = "http://tupanel.info:7390/stream"},
    {name = "Radio Concierto - FM 951", url = "https://conectperu.com/8012/stream"},
    {name = "Radio Condor Pasa", url = "https://sonic.globalstream.pro/8056/stream"},
    {name = "Radio Conoden", url = "http://stream.zeno.fm/wxpchhfw44zuv"},
    {name = "RADIO CORAL 975 FM", url = "https://maximacenterdata.com/8052/stream"},
    {name = "Radio Corazón 943 FM Lima", url = "https://mdstrm.com/audio/5fada514fc16c006bd63370f/icecast.audio"},
    {name = "Radio Cumbia OAQ-9H, 1071 Mhz FM, Chachapoyas, Amazonas", url = "http://167.114.118.120:7698/;"},
    {name = "Radio Cumbia Mix", url = "https://mdstrm.com/audio/6598b6ab95a235085823b24f/icecast.audio"},
    {name = "Radio Cumbre", url = "https://stream.zeno.fm/t8b5cmybtd0uv"},
    {name = "Radio Cutivalú", url = "https://7.innovatestream.pe:2020/stream/radiocutivalu/stream"},
    {name = "Radio Deep Music", url = "https://mpc1.mediacp.eu:8092/stream"},
    {name = "Radio Del Amor", url = "https://stream.zeno.fm/z7re4u64gd0uv"},
    {name = "Radio Diamante", url = "https://stream.zeno.fm/8s6b3v091k8uv"},
    {name = "Radio Disney Perú", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/DISNEY_PER_LMAAC.m3u8"},
    {name = "Radio Ebenezer", url = "https://strm.dal.s02.oneofthebest.org/listen/8090_radio_ebenezer/radio.mp3"},
    {name = "Radio Ebenezer Perú", url = "https://stream.zeno.fm/43k7fdktv38uv"},
    {name = "Radio Ecuajey", url = "https://radio.plhradio.com/8002/stream"},
    {name = "Radio Esfera 1033 FM", url = "https://sp.oyotunstream.com/7360/stream"},
    {name = "Radio Estacion Techno", url = "http://stream.zeno.fm/t3sqkau72rhvv"},
    {name = "Radio Estrella Trujillo 1027 Trujillo", url = "https://radio.datahost.pe/9660/stream"},
    {name = "RADIO EXITOSA 955 FM", url = "https://exitosa.cusac.online/79525baf-b0f5-4013-a8bd-3c5c293c6561"},
    {name = "Radio Fantasía Iquitos 883", url = "https://sp.oyotunstream.com:10943/stream?icy=http"},
    {name = "Radio Felicidad 889", url = "https://mdstrm.com/audio/5fad731fcf097a068af3c8f7/icecast.audio"},
    {name = "Radio Fiesta 98", url = "http://s9.voscast.com:8496/;"},
    {name = "Radio Frecuencia 100 - Trujillo", url = "http://oyotunstream.com:7066/;"},
    {name = "Radio Frecuencia Primera", url = "https://cast6.asurahosting.com/proxy/solfrecu/stream"},
    {name = "Radio Full Perú", url = "https://serverssl.innovatestream.pe:8080/167.114.118.119:7566/stream"},
    {name = "Radio Funky Hits", url = "https://stream-163.zeno.fm/57h4vyd5pf9uv"},
    {name = "Radio Galaxia 999 FM, Moquegua", url = "https://st3.inkaniserver.net:8096/stream"},
    {name = "Radio Girasol", url = "https://miradioperu.com/8008/stream"},
    {name = "RADIO HUANCAYO", url = "https://cloud9.ldwebstudios.net:7000/stream"},
    {name = "Radio Huancayo Cumbia", url = "https://stream.zeno.fm/ghubws78ipxuv"},
    {name = "Radio Inkafuego 1043Fmseñal En Vivo", url = "https://radiohd.us/8022/stream"},
    {name = "RADIO INTIRAYMI DEL CUSCO 830 AM", url = "https://streamhotsperu.purosurfm.com:8150/intiraymi"},
    {name = "Radio JHC 1077 FM", url = "https://sp.oyotunstream.com:10979/;"},
    {name = "Radio JR 887, Arequipa", url = "https://tupanel.info:2000/stream/radiojr/stream"},
    {name = "Radio Karicia", url = "https://shoutcast.tmcreativos.com/proxy/radiokar?mp=/stream"},
    {name = "RADIO KISS FM", url = "https://maximacenterdata.com/8058/stream"},
    {name = "Radio La Cheverísima - Utcubamba", url = "https://sp.onliveperu.com/8114/stream/;"},
    {name = "Radio La Fuerte", url = "https://serverssl.innovatestream.pe:8080/167.114.118.119:7322/stream"},
    {name = "Radio La Gloria Es De Dios", url = "https://radio101.mjwebexperts.com/8006/stream"},
    {name = "Radio La Inolvidable OBT-4C, 937 Mhz FM, Lima", url = "http://provisioning.streamtheworld.com/pls/CRP_LI.pls"},
    {name = "Radio La Mega", url = "https://mdstrm.com/audio/5fada56fe4e09508207a7951/icecast.audio"},
    {name = "RADIO LA MEGA 967 FM PERU", url = "https://us-b4-p-e-pb13-audio.cdn.mdstrm.com/live-audio-aw/5fada56fe4e09508207a7951?"},
    {name = "Radio La Norteña", url = "https://radio.livestreamingmundial.com:7060/live"},
    {name = "Radio La Nueva", url = "https://serverssl.innovatestream.pe:8080/167.114.118.120:7248/stream"},
    {name = "Radio La Poderosa", url = "https://turadio.accesopanel.com/8204/stream"},
    {name = "Radio La Poderosa 982 FM Lima Perú", url = "http://stream.zeno.fm/8dppgdapxneuv"},
    {name = "Radio La Unika", url = "https://cloud9.ldwebstudios.net:7011/;"},
    {name = "Radio La Vaca", url = "https://radio.streamingnacional.online/8168/stream"},
    {name = "Radio La Voz Del Nor Oriente - Utcubamba", url = "https://sp.onliveperu.com:7038/;"},
    {name = "Radio La Zona 905 FM, Lima", url = "https://mdstrm.com/audio/5fada54116646e098d97e6a5/icecast.audio"},
    {name = "Radio Latidos 947 FM Huaral", url = "https://radio.pjcks.com/9944/stream"},
    {name = "RADIO LITORAL 1059 FM", url = "https://tupanel.info:7240/stream?icy=http"},
    {name = "Radio Loreto", url = "https://sp.oyotunstream.com/8006/stream"},
    {name = "Radio Los Angeles - Chepen", url = "http://94.23.159.187:9950/;"},
    {name = "Radio Mágica 883 FM OCX-4G, Lima, Perú", url = "http://playerservices.streamtheworld.com/pls/MAG_AAC.pls"},
    {name = "RADIO MAGICA 883 FM PERU", url = "https://25093.live.streamtheworld.com/MAG_SC?"},
    {name = "Radio Marañon 961 FM", url = "http://167.114.118.120:7112/;"},
    {name = "Radio Maria Peru OAX-4M, 580 Khz AM OBT-4Z 977 Mhz FM, Lima", url = "http://dreamsiteradiocp4.com:8020/"},
    {name = "Radio Matucana 1029 FM, Lima", url = "http://radio.transmite.pe:9316/;"},
    {name = "RADIO MAXIMA DEL PERU Fono+51-925691328 PEDREGAL - MAJES", url = "https://servermax2.azuracast.com.es/listen/maximafm/radio.mp3"},
    {name = "RADIO MAXIMA DEL PERU Fono+51-925691328 SAN ISIDRO", url = "https://servermax2.azuracast.com.es/listen/maximafm/sanisidro"},
    {name = "Radio Megamix Lima", url = "https://mdstrm.com/audio/5fada56fe4e09508207a7951/live.m3u8"},
    {name = "RADIO MEGATRON MIX", url = "https://maximacenterdata.com/8084/stream"},
    {name = "RADIO METROPOLITANA SEÑAL DIGITAL- LUIS ALBERTO TEJADA TORANZO", url = "https://radios.sonidoshd.com/8082/stream"},
    {name = "Radio Milenium - Bagua Grande", url = "https://sp.onliveperu.com/8102/stream"},
    {name = "Radio Miraflores TV", url = "https://eu47-sonic.instainternet.com/8016/;"},
    {name = "RADIO MIX 1035", url = "http://stream.zeno.fm/ug8papw4nbruv"},
    {name = "RADIO MODA 973 FM PERU", url = "https://25063.live.streamtheworld.com/CRP_MOD_SC?"},
    {name = "Radio Moda FM 973", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/CRP_MODAAC.aac"},
    {name = "RADIO MUNICIPAL MONZÓN", url = "http://stream.zeno.fm/bqwzcuy64qzuv"},
    {name = "Radio Nacional Peru - La Primera", url = "https://rponline.presidencia.gob.bo/stream"},
    {name = "Radio Nova", url = "https://panel.innovatestream.pe:10989/stream"},
    {name = "Radio Nova Trujillo", url = "https://serverssl.innovatestream.pe:8080/167.114.118.120:7168/stream"},
    {name = "RADIO NOVA CHIMBOTE", url = "https://serverssl.innovatestream.pe:8080/167.114.118.120:7166/stream"},
    {name = "Radio Nova Peru", url = "https://panel.innovatestream.pe:10990/undefined"},
    {name = "Radio Nueva Q OCZ-4P, 1071 Mhz, Lima", url = "http://playerservices.streamtheworld.com/pls/CRP_NQ.pls"},
    {name = "Radio Nueve Mix", url = "http://stream.zeno.fm/tekhthm0pf9uv"},
    {name = "RADIO OASIS 931 FM", url = "https://maximacenterdata.com/8132/stream"},
    {name = "Radio Ocalli - Luya", url = "https://stream.zeno.fm/rn6uzquuqv8uv"},
    {name = "Radio Ondas Del Huallaga", url = "https://cloud9.ldwebstudios.net:7005/;"},
    {name = "Radio Oxígeno", url = "https://mdstrm.com/audio/5fab0687bcd6c2389ee9480c/live.m3u8"},
    {name = "Radio Oxígeno Classics", url = "https://mdstrm.com/audio/5fada59e471e070829a79443/live.m3u8?_=1707086785704&dnt=true&uid=MOUE1zfUKQeL2k8x9Cyh0PTzcY0u64Wd&sid=GM8ebg0PoGtgdZdUG0oA1NZ7gr4eOido&pid=xxMw0qk2RHlJIpbgRTCEJCZ8zyWj6PsT&an=audioplayer_web&at=web-app&av=vv0.1.15&sc=0&ref=audioplayer.pe&res=407x904"},
    {name = "Radio Panamericana", url = "https://mdstrm.com/audio/6598b62dded1380470f4e539/icecast.audio"},
    {name = "Radio Paz 1120 AM", url = "https://serverssl.innovatestream.pe:8080/http://167.114.118.119:7112/;"},
    {name = "RADIO PERFECCION FM", url = "https://maximacenterdata.com/8092/stream"},
    {name = "Radio Pirata Mix - Cajabamba", url = "http://167.114.118.120:7628/;"},
    {name = "Radio Planeta OCZ-4L, 1077 Mhz FM, Lima", url = "http://playerservices.streamtheworld.com/pls/CRP_PLA.pls"},
    {name = "Radio Planeta 1077", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/CRP_PLAAAC.aac?csegid=1010&dist=1010&_=928052"},
    {name = "Radio Positiva Tacna", url = "http://sp.oyotunstream.com:8034/"},
    {name = "Radio Reggae Cusco", url = "https://stream.zeno.fm/xbp613h3e8zuv"},
    {name = "Radio Ritmo Romántica", url = "http://playerservices.streamtheworld.com/pls/CRP_RIT.pls"},
    {name = "Radio Rock Hits", url = "https://live.radiorockhits.online/listen/radiorockhits/radio.mp3"},
    {name = "Radio Románticas Inolvidables Fmlima", url = "https://stream.zeno.fm/6m1ba7yt3vduv"},
    {name = "Radio RPP Mundial", url = "https://us-b4-p-e-cg11-audio.cdn.mdstrm.com/live-audio-aw/5faee885eb830d06cf22ed4a"},
    {name = "Radio RPP Noticias", url = "https://mdstrm.com/audio/5fab3416b5f9ef165cfab6e9/icecast.audio"},
    {name = "RADIO RSD Chimbote", url = "https://tupanel.info:8240/;stream.nsv"},
    {name = "RADIO RUMBA HUANUCO", url = "https://stream-176.zeno.fm/06cude657zhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIwNmN1ZGU2NTd6aHZ2IiwiaG9zdCI6InN0cmVhbS0xNzYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InhpV2FhSXNSU2NpRTF4VlItNmhQZkEiLCJpYXQiOjE3MTYzOTE5NTIsImV4cCI6MTcxNjM5MjAxMn0.f4Pl9cAClLSGCGrevzbILBXaI_jS0fm17vjS-di1DIk"},
    {name = "Radio Sabrosa Sullana", url = "https://stream.zeno.fm/zc1h9dv6pa0uv"},
    {name = "Radio Salsa Calle Latina", url = "https://stream-160.zeno.fm/erhrz6fdbnruv"},
    {name = "Radio Salsa Peru", url = "https://stream.zeno.fm/f19941g3teruv"},
    {name = "Radio San Martín", url = "https://conectperu.com:7020/stream?icy=http"},
    {name = "Radio Santa Catalina", url = "http://stream.zeno.fm/5zkxx7zp5gruv/;"},
    {name = "Radio Satélite 1007 FM, Callao", url = "https://conectperu.com/8166/stream"},
    {name = "Radio Shack Music", url = "https://c30.radioboss.fm:18415/stream"},
    {name = "RADIO SINPATRONES FM SEÑAL DIGITAL DIRECCION JUAN JOSE PALLE", url = "https://radios.sonidoshd.com/8342/stream"},
    {name = "Radio Sol De Los Andes", url = "https://cloudstream2036.conectarhosting.com/8036/stream"},
    {name = "Radio Sonrisa-Chachapoyas", url = "https://radios.sonidoshd.com/8110/stream"},
    {name = "Radio Sotelo Ancash, Llamellín 1013 Fm", url = "https://stream.zenolive.com/unde9yxcyzzuv"},
    {name = "Radio Stereo 99 - Bagua Grande", url = "https://sechin.grupocentroserver.com/radio/8300/radio.mp3"},
    {name = "Radio Stereo G La Grande - Rodriguez De Mendoza", url = "https://dattavolt.com/8138/stream"},
    {name = "Radio Stereo Mix Ferreñafe", url = "https://serverssl.innovatestream.pe:8080/167.114.118.119:7280/stream"},
    {name = "Radio Stereo TV", url = "https://sp.onliveperu.com/8098/stream"},
    {name = "Radio Studio 97", url = "https://sechin.grupocentroserver.com/radio/8140/radio.mp3"},
    {name = "Radio Super A1", url = "http://radio.transmite.pe:9308/stream?icy=http"},
    {name = "Radio Synthpop", url = "https://radio.blueditor.com/8250/stream;"},
    {name = "RADIO TRINIDAD 1070 AM", url = "https://maximacenterdata.com/8056/stream"},
    {name = "Radio Tropical Tarapoto", url = "https://shoutcast.tmcreativos.com/proxy/radiotropical?mp=/stream"},
    {name = "Radio Tropicana Paita", url = "http://167.114.118.120:6010/listen.pls?sid=1"},
    {name = "Radio Turbo Mix Cajamarca 710 Am", url = "http://167.114.118.120:7626/stream"},
    {name = "Radio Turbo Mix Cajamarca 925 Fm", url = "http://167.114.118.120:7624/stream"},
    {name = "Radio TV Ilucán", url = "http://167.114.118.120:7820/;stream"},
    {name = "Radio Un Hueco En El Espacio", url = "https://cloudstream2032.conectarhosting.com/8106/stream"},
    {name = "RADIO UNICAR", url = "https://maximacenterdata.com/8086/stream"},
    {name = "Radio UPN", url = "https://serverssl.innovatestream.pe:8080/167.114.118.119:7216/stream"},
    {name = "Radio Urbana Caraz - Ancash Peru", url = "https://144.76.202.93:10905/"},
    {name = "Radio Victor Music Perú", url = "https://stream-149.zeno.fm/wymz9unt88quv?zs=j57_3aS2T--Zd_IslHw07A"},
    {name = "Radio Victoria FM - Chachapoyas", url = "https://serverssl.innovatestream.pe:8080/http://167.114.118.119:7068/stream/1/"},
    {name = "Radio Vinilo Perú - Lima", url = "http://167.114.118.120:7246/;"},
    {name = "Radio Wari", url = "https://radio.transmite.pe/9306/stream"},
    {name = "Radio Xtrema - Chachapoyas", url = "https://stream.zeno.fm/ktk1db7xywzuv"},
    {name = "Radio Yaraví", url = "https://tupanel.info/stream/radioyaravi/stream"},
    {name = "Radio Zona 5 933 - Chiclayo", url = "http://167.114.118.120:7216/;"},
    {name = "Radio Zona Privada Tacna 967", url = "https://stream-42.zeno.fm/mmdbr61v1qruv"},
    {name = "Radio90Schimbote", url = "https://stream-162.zeno.fm/04fmqb2xwd0uv?zs=U7C6x5MaR56uI35rU7KJjA"},
    {name = "RADIOMAR", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/CRP_MARAAC.aac?csegid=1010&dist=1010&_=737686"},
    {name = "Radiomar Plus 1063 Lima", url = "http://playerservices.streamtheworld.com/m3u/CRP_MARAAC.m3u"},
    {name = "Radiomix AQP Dj Ethamx", url = "https://stream-174.zeno.fm/qa5aurigvoivv"},
    {name = "Radiomix AQP Rock-Pop En Español Dj Ethamx", url = "https://stream-150.zeno.fm/mwxnk1y5btvvv"},
    {name = "Radionuevaq", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/CRP_NQAAC.aac?csegid=1010&dist=1010&_=558458"},
    {name = "Radiorockpe", url = "https://turadio.accesopanel.com:7031/stream"},
    {name = "Radiotv Qorisonqo", url = "https://stream.zeno.fm/ar6g4002a5zuv"},
    {name = "Radiotv-Espiritu Santo A Las Naciones", url = "http://stream.zeno.fm/3khgtfrpktzuv"},
    {name = "RAM Cusco", url = "http://stream.laut.fm/ramcusco"},
    {name = "RCS Lima Stereo", url = "http://stream.zeno.fm/scy8h669dchvv"},
    {name = "Red Radio Integridad RRI", url = "https://dattavolt.com/8164/stream"},
    {name = "Rock And Pop Classics", url = "https://stream.zeno.fm/kusrlthtbhltv"},
    {name = "Rockpop", url = "http://stream.zeno.fm/0k6va3rg8rhvv"},
    {name = "RPP Mundial", url = "https://us-b4-p-e-cg11-audio.cdn.mdstrm.com/live-audio-aw/5faee885eb830d06cf22ed4a/playlist.m3u8?listeningSessionID=636caa560fe65225_1005617_y9ORJb3Z__0000001ATBc&downloadSessionID=0&aid=5faaeb72f92d7b07dfe10181&dnt=true&uid=R0YDAgaCoCna5VhlmeSkEilXCeaz9BmW&sid=1OoLSrd1pEQN1qdcGRZwIs6kaDEDCse4&pid=LbnY5aQEpPclOhLeiCC5KkywxPJ6fKyG&ref=audioplayer.pe&es=us-b4-p-e-cg11-audio.cdn.mdstrm.com&ote=1669157542833&ot=WNEzttzLwoMwo5R84PAaRA&proto=https&pz=us&cP=128000&awCollectionId=5faaeb72f92d7b07dfe10181&aw_0_1st.playerId=audioplayer_web&liveId=5faee885eb830d06cf22ed4a&referer=https%3A%2F%2Faudioplayer.pe%2F&propertyName=audioplayer_web&propertyType=web-app&propertyVersion=v0.0.199"},
    {name = "RPP Mundial Check 25112022", url = "https://us-b4-p-e-qg12-audio.cdn.mdstrm.com/live-audio-aw/5faee885eb830d06cf22ed4a"},
    {name = "RPP Mundial Perú", url = "https://us-b4-p-e-cg11-audio.cdn.mdstrm.com/live-audio-aw/5faee885eb830d06cf22ed4a/playlist.m3u8?listeningSessionID=636caa560fe65225_1006885_YNhDxhXb__0000001B3Ny&downloadSessionID=0&aid=5faaeb72f92d7b07dfe10181&dnt=true&uid=4KOWgzZ9nfekeotUYauzmeKrOQfRCQma&sid=LhXvvJVKZUrLvqSvYiI4DFZ2YiVMf0Uw&pid=GhVrREycHyvqzg9XezY4IhgwwgiPzsgQ&ref=audioplayer.pe&es=us-b4-p-e-cg11-audio.cdn.mdstrm.com&ote=1669158810445&ot=-57RkzEDB4oSQczBsPKIMw&proto=https&pz=us&cP=128000&awCollectionId=5faaeb72f92d7b07dfe10181&aw_0_1st.playerId=audioplayer_web&liveId=5faee885eb830d06cf22ed4a&referer=https%3A%2F%2Faudioplayer.pe%2F&propertyName=audioplayer_web&propertyType=web-app&propertyVersion=v0.0.199"},
    {name = "Salkantay", url = "https://serverssl.innovatestream.pe:8080/http://167.114.118.119:7662/"},
    {name = "Señal Pitara Radio", url = "http://conectperu.com:8082/stream"},
    {name = "Sikodark", url = "https://stream.zeno.fm/dm59h2uspv8uv"},
    {name = "Smooth Jazz Instrumental", url = "https://stream-155.zeno.fm/00rt0rdm7k8uv"},
    {name = "Sonorama Radio", url = "https://eu47-sonic.instainternet.com:7059/"},
    {name = "Stereo Andina", url = "http://stream.zeno.fm/92et355merruv"},
    {name = "Stereolima", url = "https://panel.innovatestream.pe/8042/stream"},
    {name = "Studio 92 925 FM Lima", url = "https://mdstrm.com/audio/5fada553978fe1080e3ac5ea/icecast.audio"},
    {name = "Studio Mix - Progreso, Amazonas En Vivo", url = "https://stream.zenolive.com/de2yzp59mg0uv"},
    {name = "Top Latino", url = "http://online.radiodifusion.net:8020/stream"},
    {name = "Vinilos", url = "https://radio.plhradio.com/8006/stream"},
    {name = "Vital FM", url = "https://cast.vox.live7.la:8501/stream"},
    {name = "Viva FM", url = "https://tupanel.info:8780/stream"},
    {name = "Z Rock Pop", url = "https://radioz.egostreaming.pe/radio/3e4f6a1b2c3d4e567890abcd/"},
    {name = "Zona Musical Esterio * Perú", url = "http://stream.zeno.fm/83eddkwsa78uv"},
    {name = "Zona Radio Activa Chimbote", url = "https://serverssl.innovatestream.pe:8080/http://184.154.28.210:9940/stream?icy=http"},
    {name = "ZOOM FM", url = "http://stream.zeno.fm/bccsy18t25quv.m3u"},
}

return stations
