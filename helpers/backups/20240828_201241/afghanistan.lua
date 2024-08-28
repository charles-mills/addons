local stations = {
    {name = "RADIO MARIAM ARABIC", url = "http://dreamsiteradiocp4.com:8046/stream"},
    {name = "Afgan Fm", url = "https://canli.arabeskinmerkezi.com/9180/stream"},
    {name = "إذاعة ماهر المعيقلي", url = "https://backup.qurango.net/radio/maher"},
    {name = "Quran", url = "https://backup.qurango.net/radio/ahmad_khader_altarabulsi"},
    {name = "80S Alive", url = "http://media2.hostin.cc/80s-alive.mp3"},
    {name = "القارئ محمد أيوب", url = "https://qurango.net/radio/mohammed_ayyub"},
    {name = "1337", url = "http://www.la1337.com/stream/la1337.mp3?sid="},
    {name = "80S Forever Radio", url = "http://premium.shoutcastsolutions.com:8050/256.mp3"},
    {name = "80S Flashback", url = "http://stream3.radio.is:443/80flashback"},
    {name = "Abc", url = "https://lounge-radio.com/aacplus.m3u"},
    {name = "Al Jazeera", url = "http://live-hls-audio-web-aja.getaj.net/VOICE-AJA/01.m3u8"},
    {name = "875 Republ1Ka FM1", url = "http://122.53.138.32:8000/dzrm.mp3"},
    {name = "90 Rak Thai", url = "http://radio11.plathong.net:8896/"},
    {name = "0-24 2000ER POP ROCK", url = "https://0-242000erpoprock.stream.laut.fm/0-24_2000er_pop_rock"},
    {name = "Ariana News TV", url = "http://d10rltuy0iweup.cloudfront.net/ATNNEWS/myStream/playlist.m3u8"},
    {name = "Ambient Space", url = "http://immortalharmony.out.airtime.pro:8000/immortalharmony_a"},
    {name = "EXA FM: په انګلیسي او هسپانوي کې پاپ موزیک", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/XHPSFMAAC.aac"},
    {name = "BBC UNHCR", url = "http://stream.live.vc.bbcmedia.co.uk/bbc_pashto_radio"},
    {name = "Bhakti World", url = "http://gurbani.out.airtime.pro:8000/gurbani_a"},
    {name = "BIAS Radio Flac", url = "https://admin.biasradio.com/radio/8000/flac"},
    {name = "Blues Radio Greece", url = "http://cast3.radiohost.ovh:8352/"},
    {name = "BEAUTIFUL INSTRUMENTALS", url = "http://hydra.cdnstream.com/1822_128"},
    {name = "BNR Horizont", url = "http://stream.bnr.bg:8011/horizont.aac"},
    {name = "Asds", url = "http://streaming.radiosenlinea.com.ar:8626/"},
    {name = "Asiafm", url = "https://live.ximalaya.com/radio-first-page-app/live/999/64.m3u8?transcode=ts"},
    {name = "Chain3", url = "https://webradio.tda.dz/Chaine3_64K.mp3"},
    {name = "Burj", url = "http://82.213.26.67:8000/stfeam"},
    {name = "Chalabi", url = "https://listen.radioking.com/radio/291025/stream/337294"},
    {name = "Br Klassik", url = "https://dispatcher.rndfnk.com/br/brklassik/live/mp3/high"},
    {name = "Coast FM", url = "http://213.175.217.198:8000/tenerife"},
    {name = "Classic Country", url = "http://185.33.21.112/ccountry_mobile_mp3"},
    {name = "Cosmo Hi", url = "https://wdr-cosmo-live.icecastssl.wdr.de/wdr/cosmo/live/mp3/128/stream.mp3"},
    {name = "Dance Wave", url = "https://dancewave.online/dance.aac"},
    {name = "Cnn", url = "https://unlimited2-ar.dps.live/cnn-ar/aac/icecast.audio"},
    {name = "Cool93", url = "https://coolism-web3rd.cdn.byteark.com/;stream/1"},
    {name = "Demem", url = "https://player.web.tr/listen/b9b96f7c7d6d6a484e13c494d7221ade"},
    {name = "Dirtybassfm", url = "http://dirtybass.fm:8000/dirtybass.mp3"},
    {name = "Deutschrap Detmold", url = "http://stream.laut.fm/deutschrapradio"},
    {name = "Cartuja Radio", url = "http://stream.zeno.fm/qernw9vu91zuv"},
    {name = "Djdjdhs", url = "http://ohmi-design.com:8170/;"},
    {name = "ESTUDIO FM INFANTIL", url = "http://stream.zeno.fm/7wdxbx1eqm0uv"},
    {name = "Flac", url = "http://stream.radioparadise.com/mellow-flac"},
    {name = "Focus", url = "http://ice.greekstream.net/focusfm?listenerid=ec33c4dfc99a6f71e6dc23583cbc91f2&awparams=companionAds:true"},
    {name = "Forst PSY", url = "https://fr1-play.adtonos.com/8103/psystation-forest-psy-trance"},
    {name = "Fb N", url = "http://direct.francebleu.fr/live/fbhautenormandie-midfi.mp3"},
    {name = "GAYFM", url = "http://stream.gayfm.de/"},
    {name = "Esradio", url = "https://libertaddigital-radio-live1.flumotion.com/libertaddigital/ld-live1-med.aac?listenerid=0c6b1192515b0c9e2f0697d3ecbf43c6&awparams=companionAds%3Atrue&aw_0_1st.version=1.1.7%3Ahtml5&aw_0_1st.playerid=jPlayer%202.9.2&aw_0_1st.skey=1601646790"},
    {name = "Fm", url = "http://stm11.streaming.profesional.bo:11300/Fb"},
    {name = "Hirschmilch Psytrance", url = "https://hirschmilch.de:7001/psytrance.mp3"},
    {name = "Hhh", url = "https://stream.zeno.fm/60pqgs97f2zuv.m3u"},
    {name = "Gradio", url = "http://stream.laut.fm/gradio-rap"},
    {name = "I24News", url = "https://bcovlive-a.akamaihd.net/773a2fa387914315ad11e6957cd54f6e/eu-central-1/5377161796001/playlist-all_dvr.m3u8?__nn__=5476555825001&hdnea=st=1653426000~exp=1653429600~acl=/773a2fa387914315ad11e6957cd54f6e/eu-central-1/5377161796001/*~hmac=aebdde505863d04e63be665d204f2b1faa531f95af73edbaa0f7a29c1f04f8f3"},
    {name = "Ig", url = "http://play.igradio.net:8000/listen.pls"},
    {name = "Gyor+", url = "https://stream.42netmedia.com:8443/sc_gyor1"},
    {name = "Jeff", url = "http://web.archive.org/web/20201128202306if_/https://live-cdn.pbskids.org/out/u/est.m3u8"},
    {name = "Indieparty By Greensleeves", url = "http://stream.laut.fm/indieparty"},
    {name = "Deutschrap TRAP", url = "http://stream.laut.fm/deutscherrap"},
    {name = "Jjj", url = "https://listen.moe/fallback"},
    {name = "Joy", url = "https://stream.joyhits.online:8072/joyhits.mp3"},
    {name = "Jus' Blues", url = "http://192.99.8.192:3444/"},
    {name = "JFSR [320Kbps]", url = "http://stream.dar.fm/10727"},
    {name = "Louange Radio", url = "https://radio13.pro-fhi.net:19079/"},
    {name = "Megastar FM", url = "http://megastar-cope-rrcast.flumotion.com/cope/megastar.mp3"},
    {name = "KQED", url = "http://streams.kqed.org/kqedradio.m3u"},
    {name = "Melody Radio Telugu", url = "https://a1.asurahosting.com:9580/radio.mp3"},
    {name = "KDPI", url = "https://peridot.streamguys1.com:5115/live"},
    {name = "MOMENTO LOVE GOSPEL", url = "http://stream.zeno.fm/526wmr2en98uv"},
    {name = "Moon Phase Radio: Ambient", url = "https://cp12.serverse.com/proxy/moonphase/stream"},
    {name = "Mujhe", url = "http://web.archive.org/web/20201128210604if_/https://adultswim-vodlive.cdn.turner.com/live/squidbillies/stream_7.m3u8"},
    {name = "Michael Jackson Music Star", url = "https://icy.unitedradio.it/um2908.mp3"},
    {name = "Nair", url = "http://198.245.61.123:8000/nair"},
    {name = "K", url = "http://stream.zeno.fm/9e880vgncd0uv"},
    {name = "NDR Info AAC", url = "https://www.ndr.de/resources/metadaten/audio/aac/ndrinfo.m3u"},
    {name = "Ndr Info", url = "https://www.ndr.de/resources/metadaten/audio/aac/ndrinfo_hh.m3u"},
    {name = "Nick Jr 1029 FM Wayback Machine", url = "http://web.archive.org/web/20200815210240if_/https://adultswim-vodlive.cdn.turner.com/live/aqua-teen/stream_7.m3u8"},
    {name = "O", url = "https://txsasdx5.github.io/iptvw/8080S.m3u"},
    {name = "Nova Classics", url = "https://nova-vnt.ice.infomaniak.ch/nova-vnt-128"},
    {name = "Ofm Stasie2", url = "https://edge.iono.fm/xice/47_high.aac"},
    {name = "Nova Bordeaux", url = "https://snb.ice.infomaniak.ch/snb-high.mp3"},
    {name = "Nova La Nuit", url = "https://nova-ln.ice.infomaniak.ch/nova-ln-128"},
    {name = "Paradise", url = "http://stream-uk1.radioparadise.com/aac-32"},
    {name = "Qamişlo", url = "http://stream.laut.fm/dengeqamishlo.m3u"},
    {name = "P", url = "https://sonic.onlineaudience.co.uk/8114/stream?listening-from-radio-garden=1657427657"},
    {name = "RAD", url = "http://213.141.131.10:8002/jazzmetal"},
    {name = "Pocoyo 1029 AM", url = "https://ga.video.cdn.pbs.org/videos/rootle/4079da95-9a9a-4532-86e5-131248390a5e/2000196692/hd-16x9-mezzanine-1080p/bpwkmaym-hls-16x9-1080p-720p-4500k.m3u8"},
    {name = "Querétaro Rock Radio Estación", url = "http://stream-51.zeno.fm/xmhshz1wyrquv?zs=QAOx4-w0R4yCtHyKg4CQ7Q"},
    {name = "KISS FM", url = "https://kissfm.kissfmradio.cires21.com/kissfm.mp3"},
    {name = "Radio Bandeirantes Goiania", url = "http://suaradio2.dyndns.ws:13633/stream"},
    {name = "Radio Activa", url = "https://stream9.mexiserver.com:7014/"},
    {name = "Radio Koszalin", url = "http://91.232.4.33:9680/listen.pls?sid=1"},
    {name = "Rradio", url = "https://metromedia.live24.gr/republicthess"},
    {name = "Radio City", url = "http://190.52.32.13:1935/radiocity/live_1/chunklist_w289002165.m3u8"},
    {name = "Radio Lola Love", url = "https://streaming.radiojat.rs/love.mp3"},
    {name = "Radio Schizoid", url = "http://94.130.113.214:8000/schizoid"},
    {name = "RADIO NORA OLDIES", url = "https://streams.norawebstreams.de/nora-oldies/mp3-192/homepage/?mode=preroll&aw_0_req.gdpr=true&aw_0_1st.kuid=vhyh95oqv&aw_0_1st.ksg=[%22tsrazhtr3%22,%22tow60dxfp%22,%22s7lqc5jxe%22,%22upxsvbudn%22,%22uphudti45%22,%22tz4swml9u%22,%22s697d7eir%22,%22s7ljhri17%22,%22s7lo2do21%22,%22s7lqvksor%22,%22s7ltd00sq%22,%22s7lul8vls%22,%22s7lvpn712%22,%22s7lwsqck7%22,%22s78nn0wkd%22,%22s71hrmzou%22,%22s8cm9eyzj%22,%22s8siicaeb%22,%22takaaes6u%22,%22ti505y9ml%22,%22tan9djjrm%22,%22ti54veycf%22,%22tow80eky2%22,%22uchw4pz1v%22]&listenerid=05ee3bdeb60ce97b7b5a8d8261306b0b&awparams=companionAds%3Atrue"},
    {name = "Radyo Bozcaada", url = "http://radyobozcaada.canliyayinda.com:4000/listen.pls"},
    {name = "Radio Tarana", url = "http://peridot.streamguys.com:7150/Tarana.aac"},
    {name = "Radio Mundo", url = "http://stream.radiomundo.uy:8000/2.mp4"},
    {name = "Rememberfm", url = "http://rememberfm.emisionlocal.com:9302/LIVE"},
    {name = "Radiowelle24", url = "http://stream.laut.fm/rw24"},
    {name = "Retró Rádió", url = "https://icast.connectmedia.hu/5001/live.mp3"},
    {name = "Rock Classics", url = "http://185.33.21.112/rockclassics_128"},
    {name = "Rockpop Perú", url = "http://stream.zeno.fm/0k6va3rg8rhvv"},
    {name = "Rockradio", url = "http://play.adtonos.com/rock-radio-warszawa"},
    {name = "RMI - Euro Didco", url = "https://cast1.torontocast.com:1335/stream"},
    {name = "Rpw", url = "https://radiostream.pl/tuba140-1.mp3"},
    {name = "Rrr", url = "http://media-ice.radiodns.ru/humour.m3u8"},
    {name = "RTVS", url = "http://icecast.stv.livebox.sk/slovensko_128.mp3"},
    {name = "SECTOR 80S", url = "http://89.223.45.5:8000/geny-flac"},
    {name = "Retrofm", url = "http://retro128.streamr.ru/"},
    {name = "Sha3By FM", url = "https://radio95.radioca.st/stream/1/"},
    {name = "Rádio Nevasca 1041 FM", url = "https://cast2.youngtech.radio.br/radio/8110/radio"},
    {name = "Spogmai Radio", url = "http://ca10.rcast.net:8026/"},
    {name = "Solar Radio", url = "https://msmn2.co/proxy/mp3high11/stream"},
    {name = "Simulator FM", url = "https://simulatorfm.stream:8025/320Kbps"},
    {name = "Sunshine-Live Fokus", url = "http://stream.sunshine-live.de/focus/mp3-128/stream.sunshine-live.de/"},
    {name = "Syaivo", url = "http://stream.ntktv.ua/syaivo.mp3"},
    {name = "Selah", url = "https://ice10.securenetsystems.net/KHHKHD3"},
    {name = "Sunnah Radio", url = "http://andromeda.shoutca.st:8189/stream"},
    {name = "Teleradio Ercolano", url = "https://rst.saiuzwebnetwork.it:19360/teleradioercolano-1/teleradioercolano-1.m3u8"},
    {name = "Tempo FM 879", url = "http://usloft6143.startdedicated.com:7322/?=usloft6143.startdedicated.com_7322.aac"},
    {name = "Veronika", url = "http://play.global.audio/veronika.aac"},
    {name = "Vesti FM", url = "http://icecast.vgtrk.cdnvideo.ru/vestifm_mp3_128kbps"},
    {name = "Vocaloid", url = "https://vocaloid.radioca.st/stream"},
    {name = "WDSW 881 - The Trail Roots, Blues Rock Cleveland, MS", url = "http://dsuradio.deltastate.edu:8000/stream"},
    {name = "Tamil", url = "http://stream.zenolive.com/7aswfbpx25quv"},
    {name = "SBS 파워 FM", url = "https://radio.bsod.kr/stream/?stn=sbs&ch=powerfm"},
    {name = "WJLI Ken Haron", url = "http://207.162.185.111:8000/kastor"},
    {name = "Авторадио ВЛ", url = "http://vladfm.ru:8000/ara"},
    {name = "Радио Дача", url = "http://194.58.122.69:8000/vdacha"},
    {name = "Монте Карло ВЛ", url = "http://194.58.122.69:8000/mcvl"},
    {name = "Романтика", url = "http://media-ice.radiodns.ru/romantika.m3u8"},
    {name = "Радіоточка", url = "https://radio.ukr.radio/ur5-mp3"},
    {name = "Радио России", url = "http://mp3.ptr-vlad.ru:8000/Radio96"},
    {name = "גלגלצ להיטים חמים", url = "http://glzwizzlv.bynetcdn.com/glglz_hits_mp3?awCollectionId=misc&awEpisodeId=glglz_hits"},
    {name = "גל עברי", url = "http://glzwizzlv.bynetcdn.com/glglz_classicil_mp3?awCollectionId=misc&awEpisodeId=glglz_classicil"},
    {name = "Русское Радио ВЛ", url = "http://194.58.122.69:8000/rrvl"},
    {name = "РУКИ ВВЕРХ", url = "https://ic6.101.ru:8000/stream/pro/aac/64/163"},
    {name = "إذاعة القرآن الكريم", url = "https://n0a.radiojar.com/0tpy1h0kxtzuv?rj-ttl=5&rj-tok=AAABhdgGORQA-2acfyF3_4WY2g"},
    {name = "إذاعة طريق السلف", url = "https://airtime.salafwayfm.ly/"},
    {name = "مختصر التفسير", url = "https://qurango.net/radio/mukhtasartafsir"},
    {name = "Test", url = "https://streaming.shoutcast.com/synchronizeradio?"},
    {name = "اذاعة القرآن الكريم", url = "http://stream.radiojar.com/0tpy1h0kxtzuv"},
    {name = "مرايا", url = "https://shls-live-ak.akamaized.net/out/v1/a4a39d8e92e34b0780ca602270a59512/index_8.m3u8"},
    {name = "新加坡亚洲新闻台（英语）", url = "https://mediacorp-videosbclive.akamaized.net/f4abbc22204c49e2b337203b0ebbf14b/ap-southeast-1/6057994443001/profile_0/chunklist.m3u8"},
    {name = "香港电台第一台", url = "https://rthkradio1-live.akamaized.net/hls/live/2035313/radio1/master.m3u8"},
    {name = "国乐悠扬", url = "http://stream3.hndt.com/now/8bplFuwp/playlist.m3u8"},
    {name = "רשת ג", url = "http://kanliveicy.media.kan.org.il/icy/kangimmel_mp3"},
    {name = "月南之音", url = "https://stream.vovmedia.vn/vov5"},
}

return stations
