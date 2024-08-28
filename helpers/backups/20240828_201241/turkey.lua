local stations = {
    {name = "1061 ARABESKİN MERKEZİ FM", url = "https://canli.arabeskinmerkezi.com/9180/stream"},
    {name = "ASPOR", url = "http://trkvz-radyolar.ercdn.net/asporradyo/playlist.m3u8"},
    {name = "GİMSA RADYO", url = "http://yayin1.canliyayin.org:9482/stream"},
    {name = "Al Quran Radio", url = "https://n0a.radiojar.com/0tpy1h0kxtzuv?rj-ttl=5&rj-tok=AAABhdgGORQA-2acfyF3_4WY2g"},
    {name = "1011 Megasite", url = "http://yayin.asymedya.com:8020/1;"},
    {name = "1011Megasite", url = "http://37.247.98.8/stream/30/"},
    {name = "1074 Radio Voyage", url = "https://dygedge.radyotvonline.net/radyovoyage/playlist.m3u8?listenerid=29d0a6a85b59cea2ca801b70d2a3ebaf&awparams=companionAds%3Atrue"},
    {name = "90Lar Turkey", url = "http://37.247.98.8/stream/166/"},
    {name = "A HABER", url = "https://trkvz-radyolar.ercdn.net/ahaberradyo/playlist.m3u8"},
    {name = "A PARA", url = "https://trkvz-radyolar.ercdn.net/apararadyo/playlist.m3u8"},
    {name = "Acik Radyo", url = "http://stream.34bit.net/ar64.mp3"},
    {name = "AÇS Radyo", url = "https://ip169.ozelip.com:10838/"},
    {name = "AFN 360 Incirlik", url = "http://playerservices.streamtheworld.com/m3u/AFNE_ICK.m3u"},
    {name = "Ahaber", url = "http://trkvz-radyolar.ercdn.net/ahaberradyo/chunklist.m3u8"},
    {name = "Akra FM", url = "https://d3r5bwwuab2v60.cloudfront.net/akracanli2/_definst_/livestream_aac/playlist.m3u8"},
    {name = "Alef Fm Mardin", url = "https://shoutcast.shemamedia.com:9040/alef"},
    {name = "Alem FM", url = "http://turkmedya.radyotvonline.com/turkmedya/alemfm.stream/playlist.m3u8"},
    {name = "ALTIN SARKILAR", url = "http://37.247.98.8/listen.pls?sid=25"},
    {name = "ALTIN ŞARKILAR", url = "https://moondigitalmaster.radyotvonline.net/altinsarkilar/playlist.m3u8"},
    {name = "Amed Radyo", url = "http://radyo.amedradyotv.net:8000/"},
    {name = "Ankara Havalari", url = "http://37.247.98.8/listen.pls?sid=30"},
    {name = "Arabesk FM", url = "http://yayin.arabeskfm.biz:8042/"},
    {name = "Arkadas Radyo", url = "http://yayin2.yayindakiler.com:4134/;stream.nsv"},
    {name = "Avrasya Türk Radyo", url = "https://sslyayin.netyayin.net:10909/"},
    {name = "Axa Rojava", url = "https://stream.zeno.fm/h6mn2c8ha8zuv"},
    {name = "Azadi Fm", url = "https://amed.ozelip.com/8040/;"},
    {name = "Baba Radyo", url = "https://babaradyo.turkhosted.com/best/babaradyo.stream/playlist.m3u8"},
    {name = "BABYLAND TURKEY", url = "https://moondigitaledge.radyotvonline.net/babyland/playlist.m3u8"},
    {name = "Banko Fm 1", url = "http://yayin.netradyom.com:9910/RADYOBANKO"},
    {name = "Batı Radyo", url = "https://sslyayin.netyayin.net:10902/"},
    {name = "BAYRAM FM TURKEY", url = "https://sslyayin.netyayin.net/3442/stream"},
    {name = "Best FM", url = "http://46.20.7.125/"},
    {name = "Bestefm", url = "https://server35971.streamplus.de/stream.mp3"},
    {name = "BİLECİK FM TURKEY", url = "http://bilecikfm.kesintisizyayin.com:9980/"},
    {name = "Bizim Radyo", url = "https://ip132.ozelip.com:7017/"},
    {name = "Bloomberghtradyo", url = "https://ciner-live.ercdn.net/bloombergradyo/bloombergradyo_1.m3u8"},
    {name = "Borusan Klasik", url = "http://provisioning.streamtheworld.com/pls/BORUSAN_KLASIKAAC.pls"},
    {name = "Botan FM", url = "http://yayin1.canliyayin.org:8026/;*.mp3"},
    {name = "BRTK", url = "http://sc.brtk.net:8000/"},
    {name = "Çağrı FM", url = "http://yayin1.canliyayin.org:8202/"},
    {name = "Can Radyo", url = "http://yayin1.yayindakiler.com:3124/;"},
    {name = "Can Tv", url = "https://livetv.canbroadcast.com:7443/canlican/tv.m3u8"},
    {name = "CLASSICLAND TURKEY", url = "https://moondigitaledge.radyotvonline.net/classicland/playlist.m3u8"},
    {name = "DAMAR TURK FM", url = "https://live.radyositesihazir.com:10997/"},
    {name = "Damarturk FM", url = "https://live.radyositesihazir.com:10997/stream?type=http&nocache=99881"},
    {name = "Damla Fm", url = "http://yayin.rtmp.org:8750/;stream.mp3"},
    {name = "Danceland", url = "https://moondigitaledge.radyotvonline.net/danceland/playlist.m3u8"},
    {name = "Danceland Anthems", url = "https://likeradiostream.com/dancelandanthems"},
    {name = "Denge Gundeme", url = "http://kesintisizyayin.com:1656/"},
    {name = "Denge Mef", url = "https://dengemed.stream.laut.fm/dengemed"},
    {name = "Denge Welat", url = "https://dengegel-rojavaradio.radioca.st/stream"},
    {name = "Dijital Radyo", url = "https://anadolu.liderhost.com.tr:10961/;"},
    {name = "Dinamofm Caffe", url = "http://channels.dinamo.fm/caffe-mp3"},
    {name = "Dinamofm Deep", url = "http://channels.dinamo.fm/deep-mp3"},
    {name = "Dinamofm Discotheque", url = "http://channels.dinamo.fm/discotheque-mp3"},
    {name = "Dinamofm Fluent", url = "http://channels.dinamo.fm/fluent-mp3"},
    {name = "Dinamofm Legacy", url = "http://channels.dinamo.fm/legacy-mp3"},
    {name = "Dinamofm Locodyno", url = "http://channels.dinamo.fm/locodyno-mp3"},
    {name = "Dinamofm Sleep", url = "http://channels.dinamo.fm/sleep-mp3"},
    {name = "Dinamofm Smog", url = "http://channels.dinamo.fm/smog-mp3"},
    {name = "Discoland", url = "https://moondigitaledge.radyotvonline.net/discoland/playlist.m3u8"},
    {name = "Diyanet Kur'An Radyo", url = "https://eustr73.mediatriple.net/videoonlylive/mtikoimxnztxlive/broadcast_5e3c14192aa92.smil/playlist.m3u8"},
    {name = "Diyanet Radyo", url = "https://eustr73.mediatriple.net/videoonlylive/mtikoimxnztxlive/broadcast_5e3c1171d7d2a.smil/playlist.m3u8"},
    {name = "Doğan 22", url = "http://yayin1.yayindakiler.com:3024/;"},
    {name = "Doğu Radyo", url = "http://198.7.59.28:8146/"},
    {name = "Dost", url = "http://yayin1.yayindakiler.com:3156/"},
    {name = "Dost FM", url = "http://yayin.dostfm.com:8920/;.mp3?no_dl"},
    {name = "Dost Radyo", url = "http://yayin1.yayindakiler.com:3156/;"},
    {name = "DREAMTÜRK FM TURKEY", url = "https://radyo.duhnet.tv/dreamturk"},
    {name = "Easyland", url = "https://moondigitaledge.radyotvonline.net/easyland/playlist.m3u8"},
    {name = "EFSANE 4LÜ TURKEY", url = "https://moondigitalmaster.radyotvonline.net/efsane4lu/playlist.m3u8"},
    {name = "EGE HAVALARI TURKEY", url = "https://moondigitalmaster.radyotvonline.net/egehavalari/playlist.m3u8"},
    {name = "Elazığ Mavi Radyo", url = "https://yayin.turkhosted.com/6066/stream"},
    {name = "Emek Radyo", url = "http://yayin1.radyohizmeti.com:8585/;"},
    {name = "Enderun FM", url = "http://yayin2.canliyayin.org:7052/;*.mp3"},
    {name = "Engelliler Radyo", url = "https://stream.zeno.fm/iuqovax9ftsvv"},
    {name = "Erkam Radyo", url = "https://api-tv5.yayin.com.tr:8002/mp3"},
    {name = "Erzincan Cem Radyo", url = "https://erzincan.80.yayin.com.tr/stream"},
    {name = "Fakir Fm", url = "https://live.radyositesihazir.com/1025/stream/"},
    {name = "Fenomen 2010'Lar 256", url = "https://live.radyofenomen.com/fenomen2010/256/chunks.m3u8"},
    {name = "Fenomen 256", url = "https://live.radyofenomen.com/fenomen/256/chunks.m3u8"},
    {name = "FENOMEN AKUSTIK", url = "https://live.radyofenomen.com/fenomenakustik/abr/fenomenakustik/128/chunks.m3u8"},
    {name = "Fenomen Clubbin 256", url = "https://live.radyofenomen.com/fenomenclubbin/256/chunks.m3u8"},
    {name = "FENOMEN DANS", url = "https://live.radyofenomen.com/fenomendans/abr/fenomendans/128/chunks.m3u8"},
    {name = "Fenomen Dans 256", url = "https://live.radyofenomen.com/fenomendans/256/chunks.m3u8"},
    {name = "FENOMEN KARISIK", url = "https://live.radyofenomen.com/fenomenkarisik/abr/fenomenkarisik/128/chunks.m3u8"},
    {name = "Fenomen Karışık 256", url = "https://live.radyofenomen.com/fenomenkarisik/256/chunks.m3u8"},
    {name = "FENOMEN POP", url = "https://live.radyofenomen.com/fenomenpop/abr/fenomenpop/128/chunks.m3u8"},
    {name = "Fenomen Pop 256", url = "https://live.radyofenomen.com/fenomenpop/256/chunks.m3u8"},
    {name = "FENOMEN RAP", url = "https://live.radyofenomen.com/fenomenrap/abr/fenomenrap/128/chunks.m3u8"},
    {name = "Fenomen Rap 256", url = "https://live.radyofenomen.com/fenomenrap/256/chunks.m3u8"},
    {name = "FENOMEN TÜRK", url = "https://live.radyofenomen.com/fenomenturk/abr/fenomenturk/256/chunks.m3u8"},
    {name = "Fenomen Türk 256", url = "https://live.radyofenomen.com/fenomenturk/256/chunks.m3u8"},
    {name = "Fenomen Türkçe Rap", url = "https://live.radyofenomen.com/fenomenturkrap/abr/fenomenturkrap/128/chunks.m3u8"},
    {name = "FG 938 Future Generation Mp3 128K", url = "https://edge1.radyotvonline.net/shoutcast/play/fg"},
    {name = "Fırat FM", url = "https://anadolu.liderhost.com.tr:10912/;"},
    {name = "Giresun FM", url = "http://yayin.canliyayin.org:9482/;"},
    {name = "GÖKKUŞAĞI RADYO TURKEY", url = "http://gokkusagiradyo.kesintisizyayin.com:8008/"},
    {name = "GOLD TÜRK", url = "http://dijimedya.radyotvonline.net/goldturk"},
    {name = "Govend Radyo", url = "https://stream-56.zeno.fm/xzzu8kynq2zuv?zs=nZP7ZCRXQPOpDFenayr0bQ"},
    {name = "Gözyaşı FM", url = "http://yayin1.canliyayin.org:8700/;*.mp3"},
    {name = "GREEKLAND", url = "https://moondigitaledge.radyotvonline.net/greekland/playlist.m3u8"},
    {name = "Gri Balkon", url = "https://gribalkon.radioca.st/listen.pls?sid=1"},
    {name = "Gundi FM", url = "http://gundifm.ozelip.com:7830/;"},
    {name = "Habertürk Radyo", url = "https://haberturkradyo.radyotvonline.net/haberturkradyo"},
    {name = "Halk Radyo", url = "https://anadolu.liderhost.com.tr:10876/;"},
    {name = "Havin Fm", url = "http://radyolar.yayindinle.net:7764/;"},
    {name = "HAYATMİX", url = "https://hayatmix.yayin.com.tr/mp3"},
    {name = "Hayatmix Slow", url = "https://radyo.yayin.com.tr:4090/mp3"},
    {name = "Hemdem Radyo", url = "http://yayin.hemdemradyo.com/"},
    {name = "HKÜ Radyo", url = "https://stream2.rtvtakip.com:7007/1"},
    {name = "HOME KLASİK TURKEY", url = "https://ssl4.radyotvonline.com/radyohome/klasikhome.stream_aac/playlist.m3u8"},
    {name = "HOS MİX", url = "https://anadolu.liderhost.com.tr:10871/"},
    {name = "HOUSELAND TURKEY", url = "https://moondigitaledge.radyotvonline.net/houseland/playlist.m3u8"},
    {name = "Https:Turkmedya-Liveercdnnettv24Tv24M3U8", url = "https://turkmedya-live.ercdn.net/tv24/tv24.m3u8"},
    {name = "Istanbul FM", url = "https://yayin.istanbulfm.com.tr/istanbulfm"},
    {name = "ITU College Radio -Classical", url = "http://160.75.86.29:8088/stream/5/"},
    {name = "ITU College Radio -Rock", url = "http://160.75.86.29:8088/stream/1/"},
    {name = "ITU Jazblues", url = "http://160.75.86.29:8088/stream/3/"},
    {name = "İTÜ Radyosu - Cazblues", url = "http://160.75.86.29:8088/itucazmp3"},
    {name = "İTÜ Radyosu Klasik", url = "http://160.75.86.29:8088/ituklasikmp3"},
    {name = "İTÜ Radyosu Rock", url = "http://160.75.86.29:8095/"},
    {name = "Joy Fm", url = "http://provisioning.streamtheworld.com/pls/JOY_FMAAC.pls"},
    {name = "JOY TÜRK AKUSTİK TURKEY", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/SC004_SO1_SC?/"},
    {name = "JOY TÜRK ROCK TURKEY", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/JOYTURK_ROCK_SC?/"},
    {name = "JOY TÜRK TURKEY", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/JOY_TURK_SC?/"},
    {name = "Kafa Radyo", url = "https://moondigitalmaster.radyotvonline.net/kafaradyo/playlist.m3u8"},
    {name = "Karadeniz FM", url = "https://moondigitaledge.radyotvonline.net/karadenizfm/playlist.m3u8"},
    {name = "Kavanoz Radyo", url = "https://live.radyositesihazir.com/8072/stream"},
    {name = "Kent FM", url = "https://moondigitalmaster.radyotvonline.net/kentfm/playlist.m3u8"},
    {name = "Keskin FM", url = "http://yayin1.canliyayin.org:8286/;stream/1"},
    {name = "KEYF STATION", url = "http://yayin.radyomadyo.com:8002/stream"},
    {name = "Kiss Beatbox", url = "https://dijimedya.radyotvonline.net/radiobeatbox"},
    {name = "Kiss Club", url = "https://dijimedya.radyotvonline.net/club"},
    {name = "KİSS DANCE TURKEY", url = "http://dijimedya.radyotvonline.net/kissdance"},
    {name = "KİSS FM TURKEY", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/KISS_FM128AAC.aac"},
    {name = "Kiss Genç", url = "https://dijimedya.radyotvonline.net/gncradyo"},
    {name = "Kiss Greatest Hits", url = "https://dijimedya.radyotvonline.net/greatesthits"},
    {name = "KİSS LOVE RADYO TURKEY", url = "https://anadolu.liderhost.com.tr:10964/"},
    {name = "Kiss Türk", url = "https://kiss.radyotvonline.net/kissturk"},
    {name = "Kisstory Türkiye", url = "https://dijimedya.radyotvonline.net/kisstory"},
    {name = "KIYI Muzik", url = "https://kiyi.radioca.st/stream"},
    {name = "Kıyı Caz", url = "http://caz.radioca.st/"},
    {name = "KLAS RADİO TURKEY", url = "https://anadolu.liderhost.com.tr:10929/"},
    {name = "KRAL FM", url = "https://dygedge2.radyotvonline.net/kralfm/playlist.m3u8?listenerid=29d0a6a85b59cea2ca801b70d2a3ebaf&awparams=companionAds%3Atrue"},
    {name = "Kral Pop", url = "http://46.20.3.201/"},
    {name = "KRAL POP ALTERNATİF 2", url = "https://ssldyg.radyotvonline.com/smil/smil:kralpop.smil/playlist.m3u8"},
    {name = "KRAL TÜRK FM", url = "https://live.radyositesihazir.com/8032/stream"},
    {name = "KRALFM", url = "http://kralwmp.radyotvonline.com/"},
    {name = "KTU", url = "https://sslyayin.netyayin.net/radyoktu/stream/;type=mp3"},
    {name = "Küpe FM", url = "https://icecast.netmedya.net/kupefm"},
    {name = "Kurd1", url = "https://www.radioking.com/play/kurd1-radyo"},
    {name = "Kurd1 FM", url = "https://listen.radioking.com/radio/119251/stream/158701"},
    {name = "Kurdm Radio", url = "http://pollux.shoutca.st:8842/;"},
    {name = "KUZEY FM TURKEY", url = "http://yayin.yayindakiler.com:3028/"},
    {name = "LALEGÜL FM", url = "https://icecast.netmedya.net/lalegulfm"},
    {name = "Lig Radyo", url = "https://turkmedya.radyotvonline.com/turkmedya/ligradyo.stream/playlist.m3u8"},
    {name = "Lokum Fm", url = "http://37.247.98.9/stream/493/?/;stream.mp3"},
    {name = "Loops Radio", url = "https://progressive.ozelip.com/7670/stream"},
    {name = "Loops Radio Chillout Station", url = "https://radyo1.radyo-dinle.tc/8248/stream"},
    {name = "Loops Radio Elektronica Station", url = "https://ssl22.radyotelekom.com/8232/stream"},
    {name = "Loops Radio House Station", url = "https://loopsdeep.ozelip.com/7806/stream"},
    {name = "Loops Radio Melodic", url = "https://radyo1.radyo-dinle.tc/8218/stream"},
    {name = "Loops Radio Techno", url = "https://ip179.ozelip.com/7688//asistan/stream/"},
    {name = "Loops Radio Trance Station", url = "https://radyo1.radyo-dinle.tc/8244/stream"},
    {name = "Magic FM", url = "http://yayin1.yayindakiler.com:3032/"},
    {name = "Mamaş Fm", url = "http://mamasfm.com:9984/;"},
    {name = "Mamaş FM Arabesk", url = "https://arabesk.mamasfm.com:3500/stream.mp3"},
    {name = "Mamaş FM Pop Müzik", url = "https://pop.mamasfm.com:4500/stream.mp3"},
    {name = "MAMAS FM POP RADYOSU", url = "http://www.mamasfm.com:4500/"},
    {name = "Mamaş FM TSM", url = "https://tsm.mamasfm.com:5000/stream.mp3"},
    {name = "Marmaris Yacht Marin FM", url = "https://radio.guventechnology.com:7003//stream/radyomarin"},
    {name = "Max FM", url = "http://live2.radyotvonline.com:8025/"},
    {name = "Max Fm 958 ‘Maximum Music'", url = "https://maxfm.radyotvonline.net/stream/164/;"},
    {name = "Maxfm", url = "http://live.radyotvonline.com:8090/;"},
    {name = "Mayday Records", url = "https://stream.maydayrecords.net/radio/8000/maydayrecords.mp3"},
    {name = "Med Radyo", url = "http://medradyo.kesintisizyayin.com:8062/listen.pls"},
    {name = "Mega Ask FM", url = "https://embed.tawk.to/_s/v4/assets/audio/chat_sound.mp3"},
    {name = "MEGA SİTE", url = "http://yayin.netradyom.com:7900/;stream.mp3"},
    {name = "Mega Site", url = "http://yayin.netradyom.com:7900/;"},
    {name = "MEGASITE", url = "https://stream.netradyom.com/listen/megasite/radio.mp3"},
    {name = "MERKEZ FM SAMSUN TURKEY", url = "http://uydu.radyotvyayini.com:8016/"},
    {name = "Meteorolojinin Sesi", url = "http://radyomgm.canliyayinda.com/;stream.mp3"},
    {name = "Metro FM", url = "http://provisioning.streamtheworld.com/pls/METRO_FMAAC.pls"},
    {name = "Metro FM 128", url = "https://27993.live.streamtheworld.com/METRO_FM128AAC.aac"},
    {name = "Metro FM 2023", url = "https://23543.live.streamtheworld.com/SC065_SO1AAC.aac"},
    {name = "Metro Fm Turkey", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/METRO_FM_SC?"},
    {name = "Mydonose 128", url = "https://22733.live.streamtheworld.com/SC010_SO1AAC.aac"},
    {name = "Nr1", url = "http://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/u_stream_5c9e2f95dcb16_1/playlist.m3u8"},
    {name = "NRG Türk", url = "https://scserv.nrgplay.com/stream/2/;"},
    {name = "NTV Radyo", url = "http://46.20.3.207/listen.pls"},
    {name = "Number One", url = "https://n10101m.mediatriple.net/numberone"},
    {name = "NUMBER ONE TURK AJDA PEKKAN", url = "https://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/u_stream_5c9e3ed520608_1/playlist.m3u8"},
    {name = "Number One Best Of", url = "https://n10101m.mediatriple.net/bestof"},
    {name = "Number One Ertuğrul Özkök", url = "https://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/u_stream_5c9e3d762b7d5_1/playlist.m3u8"},
    {name = "Number One JAZZ", url = "https://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/u_stream_5c9e3e06878b9_1/playlist.m3u8"},
    {name = "NUMBER ONE LOUNGE", url = "https://n10101m.mediatriple.net/lounge"},
    {name = "NUMBER ONE SLOW", url = "https://n10101m.mediatriple.net/slow"},
    {name = "Number One Türk", url = "https://n10101m.mediatriple.net/numberoneturk"},
    {name = "NUMBER ONE TURK ELLER HAVAYA", url = "https://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/u_stream_5c9e3303b3edf_1/playlist.m3u8"},
    {name = "NUMBER ONE WORLD", url = "https://n10101m.mediatriple.net/videoonlylive/mtkgeuihrlfwlive/u_stream_5c9e2f95dcb16_1/playlist.m3u8"},
    {name = "NUMBERONE CLASSIC TURKEY", url = "https://n10101m.mediatriple.net/classic"},
    {name = "NUMBERONE JAZZ TURKEY", url = "https://n10101m.mediatriple.net/jazz"},
    {name = "Onur Radyo", url = "http://anadolu.liderhost.com.tr:8094/"},
    {name = "Oyunpiyat", url = "https://yayin.hostwin.net/8888/stream%20%20oyunpiyatfm"},
    {name = "Özel FM", url = "https://ozelfm.80.yayin.com.tr/;stream/1"},
    {name = "Özgür Kürtçe Müzik", url = "https://ssl123.ozelip.com:7000/;"},
    {name = "Özgür Radyo", url = "http://95.173.188.170:9898/"},
    {name = "Pal Doğa", url = "http://shoutcast.radyogrup.com:1040/;*.mp3"},
    {name = "Pal Fm", url = "https://ssl4.radyotvonline.com/radyohome/palfmhome.stream/playlist.m3u8"},
    {name = "PAL Nostalji", url = "https://moondigitaledge.radyotvonline.net/palnostalji/playlist.m3u8"},
    {name = "Pal Station", url = "http://shoutcast.radyogrup.com:1020/"},
    {name = "Park Fm", url = "http://yayin.netradyom.com:8050/PARKFM/"},
    {name = "Pashpash Radio", url = "https://90s.pashpashradio.com:7001/"},
    {name = "Pazarcık", url = "http://yayin.pazarcikfm.com:9090/"},
    {name = "Pir Yolu", url = "http://radyopiryolu.canliyayinda.com:8165/"},
    {name = "Pop 90 Turkey", url = "http://provisioning.streamtheworld.com/pls/POP90AAC.pls"},
    {name = "POP HOME", url = "https://moondigitalmaster.radyotvonline.net/pophome/playlist.m3u8"},
    {name = "POP LAND", url = "https://moondigitaledge.radyotvonline.net/popland/playlist.m3u8"},
    {name = "Power Dance", url = "https://listen.powerapp.com.tr/powerdance/mpeg/icecast.audio"},
    {name = "POWER EARTH", url = "http://listen.powerapp.com.tr/powerearth/abr/playlist.m3u8"},
    {name = "Power FM Türkiye", url = "https://listen.powerapp.com.tr/powerfm/256/chunks.m3u8"},
    {name = "Power French Cafe", url = "http://mpegpowerturk.listenpowerapp.com/powerfrenchcafe/mpeg/icecast.audio"},
    {name = "Power Love", url = "http://powerlove.listenpowerapp.com/powerlove/mpeg/icecast.audio"},
    {name = "Power POP", url = "https://listen.powerapp.com.tr/powerpop/128/chunks.m3u8"},
    {name = "Power RB Hip-Hop", url = "https://listen.powerapp.com.tr/powerrbhiphop/256/chunks.m3u8"},
    {name = "Power Smooth Jazz", url = "http://powersmoothjazz.listenpowerapp.com/powersmoothjazz/abr/powersmoothjazz/128/playlist.m3u8"},
    {name = "POWER TÜRK DANS TÜRKİYE", url = "https://listen.powerapp.com.tr/powerturkdans/abr/powerturkdans/128/playlist.m3u8"},
    {name = "POWER TÜRK FM", url = "https://live.powerapp.com.tr/powerturk/abr/powerturk/128/playlist.m3u8"},
    {name = "Power Türk Taptaze", url = "http://mpegpowerturk.listenpowerapp.com/powerturktaptaze/mpeg/icecast.audio"},
    {name = "POWER XL TURKEY", url = "https://listen.powerapp.com.tr/powerextralounge/abr/powerextralounge/96/playlist.m3u8"},
    {name = "Powerturk", url = "https://live.powerapp.com.tr/powerturk/abr/playlist.m3u8"},
    {name = "Powertürk Akustik", url = "https://listen.powerapp.com.tr/powerturkakustik/abr/playlist.m3u8"},
    {name = "Powertürk Dans", url = "https://listen.powerapp.com.tr/powerturkdans/abr/playlist.m3u8"},
    {name = "Powerturk RB Hip Hop", url = "https://listen.powerapp.com.tr/powerrbhiphop/abr/playlist.m3u8"},
    {name = "Radio 44", url = "https://radyo44.80.yayin.com.tr/stream"},
    {name = "Radio 5 Turkey", url = "https://radyo.yayin.com.tr/tunein/radiotrc.asx"},
    {name = "Radio Antalya", url = "https://my.radiolize.com/radio/8000/radio.mp3"},
    {name = "Radio Glamorize", url = "https://live.radioglamorize.com/stream1"},
    {name = "Radio Light", url = "http://yayin.radiolight.net:8005/live"},
    {name = "Radio Line", url = "https://online.radioline.fm:8443/stream"},
    {name = "Radio Megasite", url = "http://yayin.asymedya.com:8020/listen.pls"},
    {name = "Radio Wanderlust", url = "http://radyo.yayin.com.tr:5898/"},
    {name = "Radioo Mega Site", url = "http://mega.netradyom.com:7900/listen.pls"},
    {name = "Radyo 13", url = "https://radyo.yayindakiler.com:3050/stream?/;stream.mp3"},
    {name = "Radyo 2000 Erzincan", url = "https://radyo.yayindakiler.com:3030/stream?/;stream.mp3"},
    {name = "RADYO 45 LIK", url = "http://server.gitassi.com:4545/stream"},
    {name = "Radyo 45Lik Yeni", url = "https://stream.radyo45lik.com:4545/"},
    {name = "Radyo 7", url = "http://46.20.3.250/;stream"},
    {name = "Radyo A Radyo Anadolu Üniversitesi", url = "http://canli.radyoa.anadolu.edu.tr:44445/Radyo_A_MP3"},
    {name = "RADYO AKDENIZ", url = "https://yayin.radyoakdeniz.com/9470/stream"},
    {name = "Radyo Alaturka", url = "https://yayin.jumboserver.net:9110/stream"},
    {name = "Radyo Arkadaş", url = "https://ssl120.radyotelekom.com.tr/9998/stream"},
    {name = "Radyo Atasehir", url = "http://162.254.207.45:9300/listen.pls?sid=1"},
    {name = "Radyo Banko", url = "https://yayin5.radyohizmeti.com:10817/;stream"},
    {name = "Radyo Banko Fm", url = "http://yayin.netradyom.com:8050/RADYOBANKO"},
    {name = "Radyo Can", url = "http://yayin2.yayindakiler.com:4174/;stream.mp3"},
    {name = "Radyo D", url = "https://moondigitaledge2.radyotvonline.net/radyod/playlist.m3u8"},
    {name = "Radyo Dejavu", url = "http://radyodejavu.canliyayinda.com:8054/"},
    {name = "Radyo Dem", url = "https://yayin.radyodem.com:8000/"},
    {name = "Radyo Duygusal", url = "https://radyoduygusal.kesintisizyayin.com:9596/;*.nsv"},
    {name = "Radyo Ekin", url = "https://yayin.turkhosted.com/6006/stream"},
    {name = "Radyo Eksen", url = "https://dygedge.radyotvonline.net/radyoeksen/playlist.m3u8"},
    {name = "Radyo Eksen 962", url = "http://eksenwmp.radyotvonline.com/;stream.mp3"},
    {name = "Radyo Erkan", url = "http://sunucu2.radyolarburada.com:8095/"},
    {name = "Radyo Esenler", url = "https://yayin2.canliyayin.org:10978/;"},
    {name = "Radyo Fenomen", url = "https://live.radyofenomen.com/fenomen/128/icecast.audio"},
    {name = "RADYO FENOMEN 2010 LAR", url = "https://live.radyofenomen.com/fenomen2010/abr/playlist.m3u8"},
    {name = "Radyo Fenomen Clubbin", url = "https://live.radyofenomen.com/fenomenclubbin/128/icecast.audio"},
    {name = "Radyo Fıtrat", url = "http://radyofitrat.radyotvonline.net/"},
    {name = "Radyo Gol", url = "https://moondigitaledge.radyotvonline.net/radyogol/playlist.m3u8"},
    {name = "Radyo Gül", url = "http://yayin2.canliyayin.org:8866/;*.mp3"},
    {name = "Radyo Hayat", url = "http://live4.radyotvonline.com:9450/"},
    {name = "Radyo Hevi", url = "http://yayin.rtmp.org:8756/;"},
    {name = "Radyo ILEF Ankara", url = "http://radyo.cc.ankara.edu.tr:8089/listen.pls"},
    {name = "Radyo Kur'An", url = "http://yayin.liderhost.net:8555/;*.mp3"},
    {name = "Radyo Light", url = "https://yayin.radiolight.net:8005/live"},
    {name = "Radyo Maranata", url = "http://medya.radyomaranata.com:8005/live"},
    {name = "Radyo Megasite", url = "http://mega.netradyom.com:7900/;"},
    {name = "Radyo Mezopotamya", url = "https://anadolu.liderhost.com.tr/9404/stream"},
    {name = "Radyo Modyan", url = "http://stream.radio.co/s55d598f42/listen"},
    {name = "Radyo Mori", url = "https://amed.ozelip.com/8040/stream"},
    {name = "Radyo Munzur 977", url = "http://yayin1.yayindakiler.com:3002/;stream.nsv"},
    {name = "RADYO MYDONOSE TÜRK", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/SC016_SO1_SC?/"},
    {name = "Radyo ODTU", url = "http://stream.radyoodtu.com.tr/;"},
    {name = "Radyo ODTU - Easy", url = "http://stream.radyoodtu.com.tr/easy"},
    {name = "Radyo ODTU - Hit", url = "http://stream.radyoodtu.com.tr/hit"},
    {name = "Radyo ODTU - Mixtape", url = "http://stream.radyoodtu.com.tr/karisikkaset"},
    {name = "Radyo ODTU - Rock", url = "http://stream.radyoodtu.com.tr/rock"},
    {name = "Radyo S", url = "http://icecast.netmedya.net/radyos"},
    {name = "Radyo Seymen", url = "https://yayin.radyoseymen.com.tr:1070/stream"},
    {name = "Radyo Sinerji", url = "https://radio.guventechnology.com/9994/stream"},
    {name = "Radyo Şiran", url = "https://live.radyositesihazir.com/8078/stream"},
    {name = "Radyo Slow Time", url = "http://46.20.7.103:8040/;"},
    {name = "Radyo Spor", url = "https://moondigitaledge.radyotvonline.net/radyospor/playlist.m3u8"},
    {name = "Radyo Sputnik", url = "https://icecast-rian.cdnvideo.ru/voicestm"},
    {name = "Radyo Taksi", url = "https://live.radyo.in/8006/stream"},
    {name = "Radyo Trafik 1042 Ankara", url = "http://live2.radyotvonline.com:8000/"},
    {name = "Radyo Trio", url = "https://radyotrio.radyotvonline.net/radyotrio"},
    {name = "Radyo Turkuvaz", url = "https://trkvz-radyolar.ercdn.net/radyoturkuvaz/playlist.m3u8"},
    {name = "Radyo Vatan Türkü", url = "http://95.0.173.195:9000/turku"},
    {name = "Radyo Viva", url = "https://moondigitaledge.radyotvonline.net/radyoviva/playlist.m3u8"},
    {name = "Radyo Voyage", url = "https://ssldyg.radyotvonline.com/pozitif/smil:voyage.smil/playlist.m3u8"},
    {name = "Radyo Yalova", url = "https://studio25.radiolize.com/radio/8200/radio.mp3"},
    {name = "Radyo Yol", url = "https://radyo.yayin.com.tr:5932/;"},
    {name = "Radyo47", url = "http://radyolar.yayindinle.net:7755/;"},
    {name = "Radyovoyage", url = "http://voyagesc.radyotvonline.com/"},
    {name = "Radyozergan", url = "http://yayin1.yayindakiler.com:3194/stream"},
    {name = "Retro Turk", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/RETROTURK_SC?/;"},
    {name = "Ribat FM", url = "http://yayin1.canliyayin.org:7010/;*.mp3"},
    {name = "Risalet Radyo", url = "https://eustr73.mediatriple.net/videoonlylive/mtikoimxnztxlive/broadcast_5e3c1520b2626.smil/playlist.m3u8"},
    {name = "RS FM", url = "http://nfw.video.ria.ru/flv/audio.aspx?ID=99244423&type=mp3"},
    {name = "S1Lhoutte FM", url = "https://s1lhouttefm.radiostream123.com/"},
    {name = "Semerkand Radyo", url = "http://mtisvwurbfcyslive.mediatriple.net/mtisvwurbfcyslive/broadcast_58e23cb112296.smil/playlist.m3u8"},
    {name = "Serhad FM", url = "http://yayin2.canliyayin.org:9372/"},
    {name = "Serhat FM", url = "http://yayin.serhatfm.com:9150/stream"},
    {name = "Sezen Radyo", url = "http://radyo1.radyo-dinle.tc:8038/"},
    {name = "Show Radio", url = "https://moondigitaledge.radyotvonline.net/show/playlist.m3u8"},
    {name = "SIZIR FM", url = "http://stream.radiojar.com/tamm1f7kk48uv"},
    {name = "Slow Karadeniz", url = "https://ssl162.ozelip.com/asistan/stream/fd02a93f231cba7593e027682f8fcad5?1682594990503"},
    {name = "Slow Timale", url = "http://37.247.100.118/stream/69/;stream.mp3"},
    {name = "Slow Turk", url = "https://radyo.duhnet.tv/ak_dtvh_slowturk"},
    {name = "Standartfm", url = "https://moondigitaledge.radyotvonline.net/standartfm/playlist.m3u8"},
    {name = "Süper 2 FM", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/SUPER2_SC.mp3"},
    {name = "Süper FM", url = "http://provisioning.streamtheworld.com/pls/SUPER_FMAAC.pls"},
    {name = "Super Fm", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/SUPER_FM_SC"},
    {name = "SUPER FM 2 TURKEY", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/SUPER2_SC?/"},
    {name = "Tezene", url = "http://37.247.98.8/stream/22/.mp3?%26token=Bsx3vK2u28-xMp98IZDV2Q%26expires=1618686860%27%20type=%27audio/mp3%27&rd2=%27https://radyo.vip/stream"},
    {name = "TGRT FM", url = "http://b01c02nl.mediatriple.net/videoonlylive/mtsxxkzwwuqtglive/broadcast_5fead000e2128.smil/playlist.m3u8"},
    {name = "Therockradio", url = "https://ssl4.radyotvonline.com/radyohome/therockradio.stream/playlist.m3u8"},
    {name = "Trakyafm", url = "http://trakyafm.canliyayinda.com:9039/"},
    {name = "TRT Diyanet Çocuk", url = "https://tv-trtdiyanetcocuk.medya.trt.com.tr/master_720.m3u8"},
    {name = "TRT FM", url = "https://trt.radyotvonline.net/trtfm"},
    {name = "TRT NAĞME", url = "https://tv-trtmuzik.medya.trt.com.tr/master_720.m3u8"},
    {name = "TRT Radyo 1", url = "https://trt.radyotvonline.net/trt1"},
    {name = "TRT Radyo Haber", url = "https://radio-trtradyohaber.live.trt.com.tr/master.m3u8"},
    {name = "TRT Radyo Kurdî", url = "https://radio-trtradyo6.medya.trt.com.tr/master.m3u8"},
    {name = "TRT Türkü", url = "https://rd-trtturku.medya.trt.com.tr/master_128.m3u8"},
    {name = "TRT3", url = "http://rd-trtradyo3.medya.trt.com.tr/master.m3u8"},
    {name = "Türkrap FM", url = "http://95.173.188.166:9984/stream"},
    {name = "Türkü Radyo", url = "https://mamasfm.com:9984/stream.mp3"},
    {name = "Turku Radyo", url = "http://radyo.turkuradyo.net:4591/listen.pls"},
    {name = "Turkuaz Anadolu", url = "https://trkvz-radyolar.ercdn.net/turkuvazanadolu/playlist.m3u8"},
    {name = "Türkülerle Türkiye", url = "http://37.247.98.8/listen.pls?sid=22"},
    {name = "Türküradyo", url = "https://yayin.turkhosted.com/4591/stream"},
    {name = "Turkuvaz Anadolu", url = "http://trkvz-radyolar.ercdn.net/turkuvazanadolu/Playlist.m3u8"},
    {name = "Turkuvaz Musiki", url = "https://trkvz-radyolar.ercdn.net/turkuvazmusiki/playlist.m3u8"},
    {name = "Ulusal Radyo", url = "http://162.254.207.45:9302/.mp3?&token=QVi8je41ac9GDLg3DshO8Q&expires=1608058155"},
    {name = "Vaaz Radyosu", url = "https://radyo.imzamedya.web.tr/8006/stream"},
    {name = "Vav Radyo", url = "https://trkvz-radyolar.ercdn.net/radyovav/playlist.m3u8"},
    {name = "Virgin Radio Türkiye", url = "https://provisioning.streamtheworld.com/pls/VIRGIN_RADIOAAC.pls"},
    {name = "X Radio", url = "https://stream.xradio.com.tr:8770/stream"},
    {name = "Yeni Radyo Nostaljinin Sesi", url = "https://eu9.fastcast4u.com/tunein/eskininadami.pls"},
    {name = "Yön Radyo", url = "https://stream.radyolarburada.com/radio/8020/yonradyo"},
    {name = "Zafer Radyo", url = "https://radyozafer.ozelip.com:8034/stream?/;stream.mp3"},
    {name = "اذاعة القرآن الكريم 🇹🇷", url = "http://stream.radiojar.com/0tpy1h0kxtzuv"},
}

return stations
