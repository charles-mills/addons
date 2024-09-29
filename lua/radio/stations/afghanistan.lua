local stations = {
    {name = "80S Alive", url = "http://media2.hostin.cc/80s-alive.mp3"},
    {name = "80S Forever Radio", url = "http://premium.shoutcastsolutions.com:8050/256.mp3"},
    {name = "90 Rak Thai", url = "http://radio11.plathong.net:8896/"},
    {name = "Abc", url = "https://lounge-radio.com/aacplus.m3u"},
    {name = "Ambient Space", url = "http://immortalharmony.out.airtime.pro:8000/immortalharmony_a"},
    {name = "Asds", url = "http://streaming.radiosenlinea.com.ar:8626/"},
    {name = "BEAUTIFUL INSTRUMENTALS", url = "http://hydra.cdnstream.com/1822_128"},
    {name = "Bhakti World", url = "http://gurbani.out.airtime.pro:8000/gurbani_a"},
    {name = "Blues Radio Greece", url = "http://cast3.radiohost.ovh:8352/"},
    {name = "Chain3", url = "https://webradio.tda.dz/Chaine3_64K.mp3"},
    {name = "Chalabi", url = "https://listen.radioking.com/radio/291025/stream/337294"},
    {name = "Classic Country", url = "http://185.33.21.112/ccountry_mobile_mp3"},
    {name = "Cnn", url = "https://unlimited2-ar.dps.live/cnn-ar/aac/icecast.audio"},
    {name = "Cool93", url = "https://coolism-web3rd.cdn.byteark.com/;stream/1"},
    {name = "Cosmo Hi", url = "https://wdr-cosmo-live.icecastssl.wdr.de/wdr/cosmo/live/mp3/128/stream.mp3"},
    {name = "Dance Wave", url = "https://dancewave.online/dance.flac.ogg"},
    {name = "Dirtybassfm", url = "http://dirtybass.fm:8000/dirtybass.mp3"},
    {name = "Djdjdhs", url = "http://ohmi-design.com:8170/;"},
    {name = "Esradio", url = "https://libertaddigital-radio-live1.flumotion.com/libertaddigital/ld-live1-med.aac?listenerid=0c6b1192515b0c9e2f0697d3ecbf43c6&awparams=companionAds%3Atrue&aw_0_1st.version=1.1.7%3Ahtml5&aw_0_1st.playerid=jPlayer%202.9.2&aw_0_1st.skey=1601646790"},
    {name = "EXA FM: په انګلیسي او هسپانوي کې پاپ موزیک", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/XHPSFMAAC.aac"},
    {name = "Fb N", url = "http://direct.francebleu.fr/live/fbhautenormandie-midfi.mp3"},
    {name = "Fm", url = "http://stm11.streaming.profesional.bo:11300/Fb"},
    {name = "Gradio", url = "http://stream.laut.fm/gradio-rap"},
    {name = "Hhh", url = "https://stream.zeno.fm/60pqgs97f2zuv.m3u"},
    {name = "Hirschmilch Psytrance", url = "https://hirschmilch.de:7001/psytrance.mp3"},
    {name = "Igradiodsn", url = "http://play.igradio.net:8000/listen.pls"},
    {name = "Indieparty By Greensleeves", url = "http://stream.laut.fm/indieparty"},
    {name = "Jjj", url = "https://listen.moe/fallback"},
    {name = "Joy", url = "https://stream.joyhits.online:8072/joyhits.mp3"},
    {name = "Jus' Blues", url = "http://192.99.8.192:3444/"},
    {name = "KDPI", url = "https://peridot.streamguys1.com:5115/live"},
    {name = "KQED", url = "http://streams.kqed.org/kqedradio.m3u"},
    {name = "Louange Radio", url = "https://radio13.pro-fhi.net:19079/"},
    {name = "Melody Radio Telugu", url = "https://a1.asurahosting.com:9580/radio.mp3"},
    {name = "Nair", url = "http://198.245.61.123:8000/nair"},
    {name = "Ndr Info", url = "https://www.ndr.de/resources/metadaten/audio/aac/ndrinfo_hh.m3u"},
    {name = "Nova Bordeaux", url = "https://snb.ice.infomaniak.ch/snb-high.mp3"},
    {name = "Nova Classics", url = "https://nova-vnt.ice.infomaniak.ch/nova-vnt-128"},
    {name = "Nova La Nuit", url = "https://nova-ln.ice.infomaniak.ch/nova-ln-128"},
    {name = "O", url = "https://txsasdx5.github.io/iptvw/8080S.m3u"},
    {name = "Ofm Stasie2", url = "https://edge.iono.fm/xice/47_high.aac"},
    {name = "P", url = "https://sonic.onlineaudience.co.uk/8114/stream?listening-from-radio-garden=1657427657"},
    {name = "Qamişlo", url = "http://stream.laut.fm/dengeqamishlo.m3u"},
    {name = "Quran", url = "https://backup.qurango.net/radio/ahmad_khader_altarabulsi"},
    {name = "RAD", url = "http://213.141.131.10:8002/jazzmetal"},
    {name = "Radio Activa", url = "https://stream9.mexiserver.com:7014/"},
    {name = "Radio Bandeirantes Goiania", url = "http://suaradio2.dyndns.ws:13633/stream"},
    {name = "Radio Koszalin", url = "http://91.232.4.33:9680/listen.pls?sid=1"},
    {name = "RADIO MARIAM ARABIC", url = "http://dreamsiteradiocp4.com:8046/stream"},
    {name = "Radio Tarana", url = "http://peridot.streamguys.com:7150/Tarana.aac"},
    {name = "Radiowelle24", url = "http://stream.laut.fm/rw24"},
    {name = "Retrofm", url = "http://retro128.streamr.ru/"},
    {name = "Retró Rádió", url = "https://icast.connectmedia.hu/5001/live.mp3"},
    {name = "RMI - Euro Didco", url = "https://cast1.torontocast.com:1335/stream"},
    {name = "Rradio", url = "https://metromedia.live24.gr/republicthess"},
    {name = "Selah", url = "https://ice10.securenetsystems.net/KHHKHD3"},
    {name = "Sha3By FM", url = "https://radio95.radioca.st/stream/1/"},
    {name = "Simulator FM", url = "https://simulatorfm.stream:8025/320Kbps"},
    {name = "Spogmai Radio", url = "http://ca10.rcast.net:8026/"},
    {name = "Sunshine-Live Fokus", url = "http://stream.sunshine-live.de/focus/mp3-128/stream.sunshine-live.de/"},
    {name = "Tempo FM 879", url = "http://usloft6143.startdedicated.com:7322/?=usloft6143.startdedicated.com_7322.aac"},
    {name = "Vesti FM", url = "http://icecast.vgtrk.cdnvideo.ru/vestifm_mp3_128kbps"},
    {name = "РУКИ ВВЕРХ", url = "https://ic6.101.ru:8000/stream/pro/aac/64/163"},
    {name = "גל עברי", url = "http://glzwizzlv.bynetcdn.com/glglz_classicil_mp3?awCollectionId=misc&awEpisodeId=glglz_classicil"},
    {name = "גלגלצ להיטים חמים", url = "http://glzwizzlv.bynetcdn.com/glglz_hits_mp3?awCollectionId=misc&awEpisodeId=glglz_hits"},
    {name = "إذاعة ماهر المعيقلي", url = "https://backup.qurango.net/radio/maher"},
    {name = "القارئ محمد أيوب", url = "https://qurango.net/radio/mohammed_ayyub"},
    {name = "مختصر التفسير", url = "https://qurango.net/radio/mukhtasartafsir"},
    {name = "月南之音", url = "https://stream.vovmedia.vn/vov5"},
}

return stations
