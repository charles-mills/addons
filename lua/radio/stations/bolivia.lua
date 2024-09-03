local stations = {
    {name = "Radio Panamericana", url = "http://stream.zeno.fm/pnwpbyfambruv"},
    {name = "Radio Fides", url = "https://usa7.fastcast4u.com/proxy/grflores?mp=/1"},
    {name = "Radio Chacaltaya", url = "https://cast6.asurahosting.com/proxy/irfradio/stream"},
    {name = "ATB Radio", url = "https://streamingenbolivia.com/8006/stream"},
    {name = "RADIO CALIENTE 1060 FM", url = "https://stm1.dimariostream.com.br:7012/stream"},
    {name = "Radio Cumbia 90S", url = "https://emiteradio.com/proxy/cumbia90s?mp=/stream"},
    {name = "Clásica 1003 Cochabamba", url = "http://radios.istbolivia.com:9976/;"},
    {name = "Radio Folklorica Uyuni", url = "https://emiteradio.com/proxy/uyuni?mp=/stream"},
    {name = "Radio San Gabriel AM 620 Khz", url = "https://spanel.gcomstreaming.com:7003/;"},
    {name = "Fm La Paz 967", url = "https://spanel.gcomstreaming.com/8018/stream"},
    {name = "Radio Centro FM 961", url = "https://radio.yoemito.net:8004/stream"},
    {name = "Radio Gigante Bolivia", url = "https://cloudstream2032.conectarhosting.com:7311/;"},
    {name = "Radio Disney - La Paz FM 1027", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/DISNEY_BOL_SCAAC.aac?dist=web-radiodisney"},
    {name = "Radio Ciudad", url = "http://streamingenbolivia.com/8002/stream"},
    {name = "Radio Aymara", url = "http://stream.zeno.fm/du0x9skxum0uv"},
    {name = "Eres Radio 985 FM", url = "https://sp5.servidorrprivado.com/8789/stream"},
    {name = "Stereo97", url = "https://stream.consultoradas.com:10942/stream"},
    {name = "Clásica 1003 FM", url = "https://ares.disfrutaenlared.com:10992/stream"},
    {name = "Red Uyuni: Radio Recuerdos", url = "https://emiteradio.com/proxy/uyuni2?mp=/stream"},
    {name = "Radio Kollasuyo FM", url = "https://azura2.bitstreaming.net:8000/radio128.aac"},
    {name = "Radio Porvenir 1071 FM", url = "https://stream-162.zeno.fm/qmygszenzhhvv?zs=UxWnTDLES_Wyuus3XtXJRQ"},
    {name = "Radio Fides Cochabamba", url = "https://usa14.fastcast4u.com/proxy/gfloresc?mp=/1"},
    {name = "Radio Estelar 925 FM", url = "http://161.35.0.33:8370/radio"},
    {name = "Radio Fides Cbba", url = "http://149.56.175.167:5654/;"},
    {name = "Radio Melodía", url = "https://stream.consultoradas.com/8194/stream"},
    {name = "RADIO HIT COCHABAMBA", url = "https://zoyradio.online:8010/hit.mp3"},
    {name = "Radio Play", url = "https://emiteradio.com/proxy/playradio?mp=/stream"},
    {name = "Coral FM 967 La Del Sabor", url = "https://stream.zeno.fm/7yetzvv8sm0uv"},
    {name = "Maritima Fm", url = "https://spanel.gcomstreaming.com/8004/stream"},
    {name = "El Fin Del Silencio", url = "https://servidor24-1.brlogic.com:7302/live"},
    {name = "Radio Illimani - Red Patria Nueva", url = "https://rponline.presidencia.gob.bo/stream"},
    {name = "Radio Estrella 931 FM", url = "https://cesarradio.realserver.es/listen/lne_93.1/radio.mp3"},
    {name = "INOLVIDABLE BOLIVIA", url = "https://zoyradio.online:8020/inolvidablebolivia.mp3"},
    {name = "El Deber Radio 1033 FM", url = "https://cast.az-streamingserver.com/proxy/grupoeld?mp=/stream"},
    {name = "PURPURA", url = "https://zoyradio.online:8110/purpura.mp3"},
    {name = "Radio Play Unica", url = "https://stream.zeno.fm/zcb3usgnc0hvv"},
    {name = "RADIO MAXIMA FM BOLIVIA -LA LAZ SISTEMA DRM SEÑAL MUNDIAL +51-925691328 PERU", url = "https://servermax2.azuracast.com.es/listen/maximafm/radio.mp3"},
    {name = "Exa FM", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/XHPSFMAAC.aac"},
    {name = "Radio Nueva Sur", url = "https://stream.zeno.fm/48k4akftus8uv"},
    {name = "Vocera De La Vega", url = "https://stream.zeno.fm/yx76pfk5feruv"},
    {name = "Radio Potencia Dinámica 958 FM", url = "https://stream-174.zeno.fm/k0pzxa1u1f8uv?zs=gU6PWbIXRUyu8V5zLdjTRg"},
    {name = "Radio Wiracocha", url = "https://stream.zeno.fm/rtui1p0xscetv"},
    {name = "Eslatino Radio", url = "https://spanel.gcomstreaming.com/8030/stream"},
    {name = "RADIO MARIA BOLIVIA", url = "http://dreamsiteradiocp4.com:8022/stream"},
    {name = "Radio San Rafael 925 FM", url = "https://guri.tepuyserver.net:7098/stream"},
    {name = "Hit 1057 FM", url = "https://stream-175.zeno.fm/u7ixfizasppvv?zs=hOeDNX_iSJaUUl90gnwQfQ"},
    {name = "Zoy Milton", url = "https://icepool.silvacast.com/GAYFM.mp3"},
    {name = "Radio San Gabriel", url = "https://spanel.gcomstreaming.com:7004/;"},
    {name = "RADIO FOX STYLE", url = "http://stream.zeno.fm/leyjhheodeutv"},
    {name = "Radio Tropical De Tarija", url = "https://stream.rcast.net/63337"},
    {name = "Radio Calacoto", url = "https://stream.zeno.fm/z73xx5qm8rhvv"},
    {name = "Ciudad Radio 1015 FM", url = "https://emiteradio.com/proxy/monteroradio?mp=/stream"},
    {name = "Oxígeno 1075 FM", url = "https://stream-160.zeno.fm/up7we7qvsg0uv?zs=gjBe9XCDQEOMJM1x8F8W1A"},
    {name = "Radio URBANA FM 952", url = "https://radio.yoemito.net:8002/stream"},
    {name = "Radio Continental 997 FM", url = "https://stream-154.zeno.fm/bdnz2z7rnwzuv?zs=E1YbP0AVR4KD_2mbCSafsQ"},
    {name = "Quechua FM", url = "https://stream-174.zeno.fm/e78z1h3drd0uv?zs=ikWueaMmSDeduBx58DWGtQ"},
    {name = "Correo Del Sur Radio FM 901", url = "https://whsh4u-panel.com/proxy/gddupgij?mp=/stream"},
    {name = "Tuti Internacional Cliza", url = "https://stream.zeno.fm/nplf6hpufi5uv"},
    {name = "Radio Oldies - Red Uyuni", url = "https://emiteradio.com/proxy/clasicosingles?mp=/stream"},
    {name = "Radio Pop - Red Uyuni", url = "https://emiteradio.com/proxy/boliviapop?mp=/stream"},
    {name = "RADIO BEAT FOX", url = "http://stream.zeno.fm/0966xr1y8p8uv"},
    {name = "Radio Disney Cochabamba 1027 FM", url = "https://22823.live.streamtheworld.com/DISNEY_BOL_SCAAC.aac"},
    {name = "Radio Ritmo 973 FM", url = "https://azura1.bitstreaming.net/listen/radio_ritmo/radio.aac"},
    {name = "Radio Guadalupe Si Suena Llallagua Bolivia", url = "http://live.turadiotv.com:9304/stream"},
    {name = "Radio Fides Cochabamba 949 FM", url = "http://usa14.fastcast4u.com:5654/stream"},
    {name = "Diana D 1021 FM", url = "https://cesarradio.realserver.es/listen/diana_d_/radio.mp3"},
    {name = "Radio Universal 1069 FM", url = "https://radio.yoemito.net:8000/stream"},
    {name = "Radio Silvania 1030 FM", url = "https://stm1.dimariostream.com.br:7016/stream"},
    {name = "Cristo Viene La Red", url = "https://stream20.usastreams.com:7000/stream"},
}

return stations
