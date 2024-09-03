local stations = {
    {name = "Radio Banovina", url = "http://stream1.radio-banovina.hr:8008/;"},
    {name = "Otvoreni Radio - Uživo", url = "http://stream.otvoreni.hr/otvoreni"},
    {name = "Extra FM", url = "http://streams.extrafm.hr:8110/;"},
    {name = "Radio Dalmacija", url = "http://shoutcast.pondi.hr:8000/listen.pls"},
    {name = "Antena Zagreb Uživo", url = "http://live.antenazagreb.hr:8002/;"},
    {name = "HRT HR 2 - Drugi Program", url = "http://playerservices.streamtheworld.com/m3u/PROGRAM2AAC.m3u"},
    {name = "Yammat FM", url = "https://stream.yammat.fm/radio/8000/yammat.mp3"},
    {name = "Banovina Turbo", url = "https://audio.radio-banovina.hr:7010/stream"},
    {name = "HRT HR 1 - Prvi Program", url = "http://playerservices.streamtheworld.com/m3u/PROGRAM1AAC.m3u"},
    {name = "Happy FM - Live", url = "http://c5.hostingcentar.com:9543/"},
    {name = "Bravo", url = "http://c5.hostingcentar.com:8059/stream?4960"},
    {name = "Happy FM - Party", url = "http://c5.hostingcentar.com:8390/"},
    {name = "Online Radio Kneginec", url = "http://stream.zeno.fm/yetzdv442k8uv"},
    {name = "HRT Radio Sljeme", url = "http://playerservices.streamtheworld.com/m3u/SLJEMEAAC.m3u"},
    {name = ":: CLUB MUSIC RADIO :::: 70S 80S 90S ::", url = "http://cmr-hosting.com:8030/stream?type=http&nocache=773949"},
    {name = "Radio Stubica", url = "http://radiostubica.hc.hr:7006/stream"},
    {name = "ENTER Zagreb", url = "http://live.enterzagreb.hr:8023/"},
    {name = "HRT Radio Rijeka", url = "http://playerservices.streamtheworld.com/m3u/RIJEKAAAC.m3u"},
    {name = "Laganini FM", url = "http://194.145.208.251:8000/start/lfmzg"},
    {name = "Radio Istra", url = "http://uk1.streamingpulse.com:7117/stream"},
    {name = "Radio Techno Dance Kneginec", url = "http://stream.zeno.fm/8d2pyzm5wp8uv"},
    {name = "Radio Dalmacija - Fjaka", url = "http://c5.hostingcentar.com:8203/stream"},
    {name = "Radio Deejay HR", url = "http://live.deejay.hr:7002/;"},
    {name = "Otvoreni Radio", url = "https://stream.otvoreni.hr/otvoreni"},
    {name = "Radio Tvornica", url = "https://c8.hostingcentar.com/streams/radiotvornica?type=http&nocache=50001"},
    {name = "Radio Marija", url = "http://dreamsiteradiocp4.com:8080/"},
    {name = "Radio Nacional Croatia", url = "http://nnc1-bpmmc501.radioca.st/stream"},
    {name = "CMC Kids", url = "http://radio-stream.cmc.com.hr:8090/autodj"},
    {name = "Radio Dalmacija - Rokija", url = "http://c5.hostingcentar.com:8209/stream"},
    {name = "Antena Zagreb - Live", url = "http://live.antenazagreb.hr:8000/;"},
    {name = "Novi Radio Zadar", url = "http://s8.iqstreaming.com:8022/stream"},
    {name = "Radio Sova", url = "http://evcast.mediacp.eu:1960/stream"},
    {name = "Top Radio", url = "https://c5.hostingcentar.com/streams/topradio/"},
    {name = "CMC Jugoton", url = "http://radio-stream.cmc.com.hr:8020/autodj"},
    {name = "CMC Tambure", url = "http://radio-stream.cmc.com.hr:8050/autodj"},
    {name = "HKR", url = "http://stream.hkr.hr:8000/hkr.mp3"},
    {name = "Radio Dalmacija - Oliver", url = "http://c5.hostingcentar.com:8275/stream"},
    {name = "HRT HR2 - Drugi Program", url = "https://25593.live.streamtheworld.com/PROGRAM2.mp3"},
    {name = "Narodni - Ne Pitaj, Samo Sviraj", url = "http://c5.hostingcentar.com:8348/;"},
    {name = "HRT Radio Split", url = "http://playerservices.streamtheworld.com/m3u/SPLITAAC.m3u"},
    {name = "JR Radio", url = "http://stream.zeno.fm/pdkt234k698uv.mp3"},
    {name = "Antena Zagreb Rock", url = "http://live.antenazagreb.hr:8019/"},
    {name = "HRT Radio Pula", url = "http://playerservices.streamtheworld.com/m3u/PULAAAC.m3u"},
    {name = "Gold FM", url = "http://live.goldfm.hr:8068/"},
    {name = "CMC Dalmatina", url = "http://radio-stream.cmc.com.hr:8040/autodj"},
    {name = "ZFM", url = "https://ec2s.crolive.com.hr:7015/stream"},
    {name = "HRT HR2", url = "http://23543.live.streamtheworld.com/PROGRAM2.mp3"},
    {name = "Radio Kaj", url = "https://s8.iqstreaming.com:2020/stream/radio-kaj2/stream"},
    {name = "RADIO SPLIT - HRVATSKI RADIO", url = "http://23543.live.streamtheworld.com/SPLIT.mp3"},
    {name = "Radio Sunce", url = "http://shoutcast.pondi.hr:8002/;*.mp3"},
    {name = "Radio Nacional", url = "https://nnc1-bpmmc501.radioca.st/stream"},
    {name = "Bravo Kids", url = "https://audio.social3.hr/listen/bravo_kids/stream?3367"},
    {name = "Happy FM", url = "http://c5.hostingcentar.com:9543/stream?4923"},
    {name = "Antena Zagreb Hit", url = "http://live.antenazagreb.hr:8011/"},
    {name = "Laganini FM Rijeka", url = "http://194.145.208.251:8004/start/lfmri"},
    {name = "HRT Glas Hrvatske", url = "http://playerservices.streamtheworld.com/m3u/VOICEOFCROATIAAAC.m3u"},
    {name = "Narodni - Uživo", url = "http://c5.hostingcentar.com:8059/;"},
    {name = "Naxi House", url = "http://naxidigital-house128.streaming.rs:8000/listen.pls"},
    {name = "CMC Radio", url = "http://radio-stream.cmc.com.hr:8001/autodj"},
    {name = "Radio 057", url = "http://streaming.zadar.net:8000/radio057"},
    {name = "Radio Ritam Šibenik", url = "https://ec2s.crolive.com.hr:8455/stream"},
    {name = "Radio 101", url = "http://live.radio101.hr:9531/stream.mp3"},
    {name = "Radio Eurostar Umag", url = "http://mcp1.mydataknox.com:8012/stream"},
    {name = "Radio101", url = "http://live.radio101.hr:9531/"},
    {name = "Radio Megaton", url = "https://chopin.bizmusic.net/radio/8030/radio.mp3"},
    {name = "Radio 808", url = "http://stream.radio808.info:8003/listen.pls"},
    {name = "Antena Zagreb - Xmas", url = "http://live.antenazagreb.hr:8015/;"},
    {name = "Ultra Split", url = "http://c5.hostingcentar.com:8061/;stream/1"},
    {name = "Club Music Radio - FOLK", url = "https://cmr-hosting.com:7001/;stream/1"},
    {name = "Club Music Radio - ITALO DISCO", url = "https://cmr-hosting.com:7005/;stream/1"},
    {name = "HRT HR 2", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/PROGRAM2.mp3"},
    {name = "Zagorski Radio", url = "https://s8.iqstreaming.com:2020/stream/zagorski/stream"},
    {name = "Happy FM - Fest", url = "http://c5.hostingcentar.com:8372/"},
    {name = ":: Radio Ludnica :: Original Croatian Internet Radio ::", url = "http://patmos.cdnstream.com:8222/stream?type=http&nocache=120427"},
    {name = ":: CLUB MUSIC RADIO :::: Exyu POP-ROCK ::", url = "http://cmr-hosting.com:8080/stream?type=http&nocache=13098"},
    {name = "CMC Rock", url = "http://radio-stream.cmc.com.hr:8060/autodj"},
    {name = "Radio Ludnica", url = "http://192.111.140.6:8222/"},
    {name = "Happy FM Fest", url = "http://c5.hostingcentar.com:8372/stream?4956"},
    {name = "Bijelo-Plavi Radio", url = "http://s8.iqstreaming.com:8028/stream"},
    {name = "Happy FM Croatia", url = "http://c5.hostingcentar.com:9543/stream?1820"},
    {name = "Top Radio Yugo", url = "https://audio.social3.hr/listen/top_exyu/stream?8298"},
    {name = "HRT HR 3 - Treći Program", url = "http://playerservices.streamtheworld.com/m3u/PROGRAM3AAC.m3u"},
    {name = "Club Music Radio - Dance", url = "https://cmr-hosting.com:7002/;stream/1"},
    {name = "Radio Brac", url = "http://s8.iqstreaming.com:8066/listen.pls"},
    {name = "Radio Vinkovci", url = "https://onlineradiobox.com/json/hr/vinkovci/play?platform=web"},
    {name = "Braniteljski Radio Nepokoreni Grad", url = "http://s3.radio.co/se83499ee0/listen"},
    {name = ":: CLUB MUSIC RADIO :::: Folk ::", url = "http://cmr-hosting.com:8010/stream?type=http&nocache=401572"},
    {name = ":: CLUB MUSIC RADIO :::: TAMBURA ::", url = "http://cmr-hosting.com:8070/stream?type=http&nocache=646624"},
    {name = "Otvoreni Radio Fitness", url = "http://stream.otvoreni.hr/fitness"},
    {name = ":: CLUB MUSIC RADIO :::: LOVE SONG ::", url = "http://cmr-hosting.com:8040/stream?type=http&nocache=869535"},
    {name = "Radio 101 ROCK", url = "https://live.radio101.hr:8010/;"},
    {name = "RADIO MARIA CROATIA", url = "http://dreamsiteradiocp4.com:8080/stream"},
    {name = "Poslovni FM", url = "https://ec2s.crolive.com.hr:2665/stream"},
    {name = "Radio Media Servis", url = "http://live.mediaservis.hr:8084/stream?type=http&nocache=557757"},
    {name = "Bravo Balade", url = "http://c5.hostingcentar.com:8360/stream?1510"},
    {name = "Happy FM Party", url = "http://c5.hostingcentar.com:8390/stream?4606"},
    {name = "Happy FM Tambura", url = "http://c5.hostingcentar.com:8378/stream?3238"},
    {name = "Club Music Radio Tambura", url = "http://cmr-hosting.com:8070/"},
    {name = "Top Radio Rock", url = "https://audio.social3.hr/listen/top_radio_rock/stream?7435"},
    {name = "Otvoreni LIVE", url = "https://stream.otvoreni.hr/stream48"},
    {name = "Antena Zagreb Dance", url = "http://live.antenazagreb.hr:8015/"},
    {name = "Antena Zagreb Love", url = "http://live.antenazagreb.hr:8007/"},
    {name = "Studentski Radio UNIOS", url = "http://radio.unios.hr:8000/stream.mp3"},
    {name = "Radio Gorski Kotar", url = "http://144.76.39.214:9500/stream.mp3"},
    {name = "Hrvatski Katolički Radio", url = "https://stream.hkr.hr/hkr.mp3"},
    {name = "Club Music Radio - LOVE SONG", url = "https://cmr-hosting.com:7004/;stream/1"},
    {name = "Club Music Radio - CRO HITS", url = "https://cmr-hosting.com:7006/;stream/1"},
    {name = "Club Music Radio - TAMBURA", url = "https://cmr-hosting.com:7007/;stream/1"},
    {name = "Hrvatski Radio Vukovar", url = "http://live.hrv.hr:8000/hrv"},
    {name = "Happy FM - Klape", url = "http://c5.hostingcentar.com:8384/"},
    {name = "Klfmorg", url = "https://klfmorgborg.radioca.st/stream?type=http&nocache=1089"},
    {name = "Happy FM - Tambura", url = "http://c5.hostingcentar.com:8378/"},
    {name = "Happy FM - Legenda", url = "http://c5.hostingcentar.com:8396/"},
    {name = "Hrvatski Radio - Rock", url = "https://provisioning.streamtheworld.com/pls/HR_ROCK.pls"},
    {name = "Radio Marija Bistrica", url = "http://178.218.163.171:8024/stream"},
    {name = ":: CLUB MUSIC RADIO :::: CRO HITS ::", url = "http://cmr-hosting.com:8060/stream?type=http&nocache=823456"},
    {name = "Tvoj Feel Good Radio Otvoreni", url = "https://stream2.otvoreni.hr/otvoreni"},
    {name = "Radio Ploce 64,5 Mhz", url = "http://178.218.163.171:8010/ploce"},
    {name = "Otvoreni Radio Ho-Ho", url = "http://stream.otvoreni.hr/hoho"},
    {name = "Otvoreni Radio Chill", url = "http://stream.otvoreni.hr/chill"},
    {name = "CMC Lagano", url = "http://radio-stream.cmc.com.hr:8030/autodj"},
    {name = "CMC Zabavni", url = "http://radio-stream.cmc.com.hr:8085/autodj"},
    {name = "Radio Preporod", url = "http://s1.voscast.com:7986/;"},
    {name = "Otvoreni Radio - Love", url = "https://stream.otvoreni.hr/love"},
    {name = "Radio 101 Soft Sound", url = "https://live.radio101.hr:8020/"},
    {name = "Slavonski Radio", url = "https://ec2s.crolive.com.hr:8035/stream"},
    {name = "Otvoreni Radio - Ho Ho", url = "https://stream.otvoreni.hr/hoho"},
    {name = "CRASH", url = "http://live.radiocrash.net/"},
    {name = "Radio Šibenik", url = "http://144.76.219.22:8215/stream.mp3?ver=421911"},
    {name = "Radio Koprivnica", url = "http://194.152.206.205:8000/"},
    {name = "Radio Maestral Pula", url = "http://ec2s.crolive.com.hr:1630/stream"},
    {name = "Top Radio Gold", url = "https://audio.social3.hr/listen/top_radio_gold/stream?7802"},
    {name = "Radio Vrbovec 945", url = "http://c2.hostingcentar.com:9452/;"},
    {name = "Top Radio Pop", url = "https://audio.social3.hr/listen/top_radio_pop/stream?5483"},
    {name = "Radio Nova Gradiška", url = "http://comet.shoutca.st:8050/"},
    {name = "Pitomi Radio", url = "http://194.145.208.251:8022/stream?1580651040750.mp3"},
    {name = "HRT Radio Osijek", url = "http://playerservices.streamtheworld.com/m3u/OSIJEKAAC.m3u"},
    {name = "Radio Quirinus 917", url = "http://s8.iqstreaming.com:8064/stream"},
    {name = "Radio Blagovesti", url = "http://radio.manastir-lepavina.org:8000/listen.pls"},
    {name = "Radio Jaska", url = "https://uk1.streamingpulse.com/ssl/RadioJaska"},
    {name = "Club Music Radio - 70'S 80'S 90'S", url = "https://cmr-hosting.com:7003/;stream/1"},
    {name = "Hit Radio", url = "http://s8.iqstreaming.com:8012/;stream.mp3"},
    {name = "R Dalmacija", url = "http://shoutcast.pondi.hr:8000/;"},
    {name = "Radio Martin", url = "http://genf196.server4you.de:8585/"},
    {name = "Narodni - AAAAAAA", url = "http://c5.hostingcentar.com:8360/;"},
    {name = "Radio Biograd Na Moru", url = "https://onlineradiobox.com/json/hr/bnm/play?platform=web"},
    {name = "HRT Radio Zadar", url = "http://playerservices.streamtheworld.com/m3u/ZADARAAC.m3u"},
    {name = "Otvoreni Radio - Fitness", url = "https://stream.otvoreni.hr/fitness"},
    {name = "HRT Radio Dubrovnik", url = "http://playerservices.streamtheworld.com/m3u/DUBROVNIKAAC.m3u"},
    {name = "RADIO KASTAV", url = "http://proxima.shoutca.st:8559/stream"},
    {name = "Radio Orahovica", url = "https://ec2s.crolive.com.hr:2595/stream"},
    {name = "Hrvatski Radio - Klasik", url = "https://provisioning.streamtheworld.com/pls/HR_CLASSICS.pls"},
    {name = "Hrvatski Radio - Jazz", url = "https://provisioning.streamtheworld.com/pls/HR_JAZZ.pls"},
    {name = "Gold - Velika Gorica", url = "http://live.goldfm.hr:8068/listen.pls"},
    {name = "Radio Slavonija", url = "http://s8.iqstreaming.com:8026/listen.pls"},
    {name = "Https:Clubmusic-1Com", url = "http://cmr-hosting.com:8050/stream?type=http&nocache=5796"},
    {name = "Radio M 90,1 Mhz", url = "http://radiomvelaluka.ddns.net:8000/stream"},
    {name = "Radio DJ Grga", url = "http://cmr-hosting.com:8430/stream?type=http&nocache=343"},
    {name = "CMC Festival", url = "http://radio-stream.cmc.com.hr:8070/autodj"},
    {name = "CMC Classic", url = "http://radio-stream.cmc.com.hr:8100/autodj"},
    {name = "Radio Otok Krk", url = "https://s8.iqstreaming.com:8014/stream"},
    {name = "Radio Samobor", url = "http://185.150.235.162/"},
    {name = "Radio Grubišno Polje", url = "https://ec2s.crolive.com.hr:8215/stream"},
    {name = "Radio 92 FM", url = "https://onlineradiobox.com/json/hr/92fm/play?platform=web"},
    {name = "Hit Rado Sinj", url = "http://s8.iqstreaming.com:8012/listen.pls?sid=1"},
    {name = "Bravo Rock", url = "http://c5.hostingcentar.com:8348/stream?1996"},
    {name = "Radio Križevci", url = "https://s8.iqstreaming.com:8048/stream"},
    {name = "HR Klasik", url = "http://25503.live.streamtheworld.com/HR_CLASSICSAAC_SC"},
    {name = "City-Radio 886", url = "http://s8.iqstreaming.com:8058/stream;"},
    {name = "Laganini Osijek", url = "http://194.145.208.251:8012/start/lfmos"},
    {name = "Radio Marija Hrvatska", url = "https://dreamsiteradiocp2.com/proxy/rmcroatia?mp=/stream"},
    {name = "Zabavni Radio", url = "https://genf196.server4you.de:8585/"},
    {name = "Hrvatski Radio Čakovec Doo Stream", url = "http://live.radio-cakovec.hr:7020/stream"},
    {name = "HRT Radio Knin", url = "http://playerservices.streamtheworld.com/m3u/KNINAAC.m3u"},
    {name = "Soundset Ragusa", url = "http://178.218.163.171:8012/stream"},
    {name = "Cro International DJ Radio", url = "http://stream.zeno.fm/t47dykadrchvv"},
    {name = "Otvoreni Radio - Chill", url = "https://stream.otvoreni.hr/chill"},
    {name = "Radio Centar Studio Poreč", url = "http://radiocentar.hr:8282/mp3"},
    {name = "RADIO MARIA", url = "http://dreamsiteradiocp.com:8026/stream?type=http&nocache=215"},
    {name = "Radio Otocac", url = "http://s8.iqstreaming.com:8024/stream"},
    {name = "Radio Roza", url = "http://stream.radio-roza.org/live.mp3"},
    {name = "Hrvatski Radio Karlovac", url = "http://s8.iqstreaming.com:8002/"},
    {name = "TOP POP", url = "http://116.202.235.114:8420/"},
    {name = "TOP GOLD", url = "http://116.202.235.114:8414/"},
    {name = "Obiteljski Radio Ivanić", url = "http://s8.iqstreaming.com:8080/stream"},
    {name = "Narodni - Ljubav Je U Zraku", url = "http://c5.hostingcentar.com:8354/;"},
    {name = "Otvoreni Radio - Hot", url = "https://stream.otvoreni.hr/hot"},
    {name = "Radio Prkos", url = "http://eu7.fastcast4u.com:6124/stream"},
    {name = "Petrinjski Radio", url = "http://s8.iqstreaming.com:8062/"},
    {name = "Hrvatski Radio - Pop Glazba", url = "https://provisioning.streamtheworld.com/pls/HR_POP.pls"},
    {name = "Bravo Pop", url = "http://c5.hostingcentar.com:8354/stream?2340"},
    {name = "Happy FM Klape", url = "http://c5.hostingcentar.com:8384/stream?8802"},
    {name = "Happy FM Legenda", url = "http://c5.hostingcentar.com:8396/stream?8550"},
    {name = "Radio Dalmacija - Furešta", url = "http://c5.hostingcentar.com:8215/stream"},
    {name = "Radio Dalmacija - Hajdučke", url = "http://c5.hostingcentar.com:8221/stream"},
    {name = "Laganini Požega", url = "http://194.145.208.251:8008/start/lfmpz"},
    {name = "Otvoreni Love", url = "https://stream2.otvoreni.hr/love"},
    {name = "Otvoreni Fitness", url = "http://stream2.otvoreni.hr/fitness"},
    {name = "Radio Kampus Split", url = "https://audio.alter-media.hr/9128/stream"},
    {name = "Radio Slunj 952", url = "http://s3.iqstreaming.com/tunein.php/slunj/playlist.pls"},
    {name = "Laganini FM - Rijeka", url = "http://194.145.208.251:8004/stream?type=http&nocache=149"},
    {name = "TOP ROCK", url = "http://116.202.235.114:8408/"},
    {name = "TOP YOU", url = "http://116.202.235.114:8402/"},
    {name = "Radio Novska", url = "http://genf196.server4you.de:8686/"},
}

return stations
