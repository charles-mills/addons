local stations = {
    {name = "RNZ National", url = "http://radionz-ice.streamguys.com/national.mp3"},
    {name = "Newstalk ZB Auckland", url = "https://ais-nzme.streamguys1.com/nz_002_aac"},
    {name = "Sleep Radio", url = "https://cast4.asurahosting.com:2199/tunein/sleeprad.pls"},
    {name = "The Edge", url = "https://digitalstreams.mediaworks.nz/edge_net/playlist.m3u8"},
    {name = "The Rock", url = "https://digitalstreams.mediaworks.nz/rock_net/playlist.m3u8"},
    {name = "The Breeze", url = "https://digitalstreams3.mediaworks.nz/breeze-HST-high/playlist.m3u8"},
    {name = "新西兰华人之声AM936新超凡", url = "http://radio.936.nz:8000/am936"},
    {name = "Easy 80S", url = "http://procyon.shoutca.st:8032/;"},
    {name = "More FM", url = "https://digitalstreams4.mediaworks.nz/more-CHC-high/playlist.m3u8"},
    {name = "3ABN Christian Radio", url = "https://stream.3abnaustralia.org.au:8443/stream"},
    {name = "Wandering Sheep Radio - Christian Smooth Jazz", url = "http://radio.wanderingsheep.tv:8021/christianjazz"},
    {name = "Coast FM", url = "https://ais-nzme.streamguys1.com/nz_011/playlist.m3u8"},
    {name = "Radio Hauraki", url = "https://ais-nzme.streamguys1.com/nz_009_aac"},
    {name = "Rush FM", url = "http://rushbroadcasting.serverroom.us:5204/;"},
    {name = "RNZ - Radio New Zealand International", url = "http://radionz-ice.streamguys.com/international.mp3"},
    {name = "The Rock - Nz'S #1 Rock Radio Station", url = "https://digitalstreams.mediaworks.nz/rock_net_icy"},
    {name = "The Hits 896 Nelson - New Zealand", url = "http://ais-nzme.streamguys1.com/nz_020_aac"},
    {name = "The Sound", url = "https://digitalstreams.mediaworks.nz/sound_net/playlist.m3u8"},
    {name = "George FM", url = "https://digitalstreams.mediaworks.nz/george_net/playlist.m3u8"},
    {name = "RNZ Concert AAC+", url = "http://radionz-ice.streamguys.com/fallback-concert_aac128"},
    {name = "Channel X", url = "https://digitalstreams4.mediaworks.nz/chx-AKL-high/playlist.m3u8?"},
    {name = "Mai FM", url = "https://ais-sa1.streamon.fm/7102_128k.aac"},
    {name = "George FM Club Classics", url = "https://18743.live.streamtheworld.com/GEORGEFM_CC_S01.aac"},
    {name = "95BFM", url = "https://streams.95bfm.com/stream95"},
    {name = "Radio Rock FM", url = "http://www.radiorockfm.co.nz:8000/listenlive"},
    {name = "Kiwi Folk Radio", url = "https://streamer.radio.co/sde527a41e/listen"},
    {name = "Brian FM 1056 Nelson NZ", url = "https://ais-sa1.streamon.fm/7358_128k.aac/playlist.m3u8?"},
    {name = "Sub FM", url = "https://fmsub.radioca.st/stream?type=http&nocache=140"},
    {name = "Flava Auckland 958 FM", url = "https://ais-nzme.streamguys1.com/nz_010_aac"},
    {name = "Jazzgrooveorg - Smooth Jazz 64K", url = "http://streams.radiomast.io/4fdf004c-c2f3-49c1-bdb1-22e208d48780"},
    {name = "Mushroom Escape", url = "https://cast3.my-control-panel.com/proxy/jonatha1/escape?1664781783632"},
    {name = "Retro Hit Radio", url = "https://riphel02.radioca.st/;"},
    {name = "Metalradioconz", url = "http://curiosity.shoutca.st:9073/stream"},
    {name = "GOLD 1054 Auckland - New Zealand", url = "http://ais-nzme.streamguys1.com/nz_015_aac"},
    {name = "Gaia FM New Zealand", url = "https://gaiafm.stationplaylist.com/listen.asx"},
    {name = "KIX FM", url = "https://stream.kixfm.co.nz:8178/stream"},
    {name = "ZM Wellington", url = "https://ais-nzme.streamguys1.com/nz_061_aac"},
    {name = "East FM", url = "http://listen.eastfm.nz/stream.mp3"},
    {name = "Lifefm", url = "http://rhema-radio.streamguys1.com/rhema-lifefm.mp3"},
    {name = "ZM", url = "https://ais-nzme.streamguys1.com/nz_008_aac"},
    {name = "RCR Reality Check Radio M3U8", url = "https://cast.realitycheck.radio/hls/realitycheck_radio/aac_hifi.m3u8"},
    {name = "Gold AM Nz", url = "https://ais-nzme.streamguys1.com/nz_016/playlist.m3u8"},
    {name = "新西兰华人之声FM994真快活", url = "http://radio.936.nz:8000/fm994"},
    {name = "Radio Tarana", url = "http://ais-nzme.streamguys1.com/nz_116_aac"},
    {name = "Radio One 91FM", url = "https://play.r1.co.nz/live"},
    {name = "Newstalk ZB Christchurch", url = "http://streaming.radiomyway.co.nz/zbchalt.pls"},
    {name = "Chill-Radio", url = "https://media-sov.musicradio.com/Chill"},
    {name = "Brian FM 912 Wanganui NZ", url = "https://ais-sa1.streamon.fm/7100_128k.aac"},
    {name = "Beachfm 1063", url = "http://s8.myradiostream.com:58408/"},
    {name = "Dave FM", url = "http://davefmradio.no-ip.org:8000/stream"},
    {name = "Magic", url = "https://digitalstreams.mediaworks.nz/mmusic_net/playlist.m3u8"},
    {name = "Newstalk ZB Wellington", url = "http://streaming.radiomyway.co.nz/zbwnalt.pls"},
    {name = "SENZ - New Zealand", url = "https://sen.streamguys1.com/SENZ-AAC/playlist.m3u8"},
    {name = "RDU 985FM", url = "https://rdu985fm-gecko.radioca.st/listen.pls?sid=1"},
    {name = "Switch FM Gisborne", url = "http://s8.myradiostream.com:56886/listen.m4a"},
    {name = "Smooth 1056FM", url = "https://servidor26.brlogic.com:7110/live"},
    {name = "Akaroa World Radio", url = "https://n07.radiojar.com/k0t12bsns1duv?rj-ttl=5&rj-tok=AAABf7nGP10A7NK4A0_6v63i4w"},
    {name = "Mountainside FM", url = "http://stream.nrgkits.co.nz:5000/mountainside"},
    {name = "Radio Lemon Live New Zealand", url = "https://schedule.radiolemonlive.com:7443/listen/radio_lemon_live_newzealand/live"},
    {name = "Radio Robotic", url = "https://stream.zeno.fm/rhscse2a41zuv"},
    {name = "Te Hiku Radio", url = "http://libreice.tehiku.radio:8000/tehikufm_ogg"},
    {name = "Radiowave NZ", url = "https://listen.radioking.com/radio/106324/stream/145267"},
    {name = "Gone Country", url = "https://usa10.fastcast4u.com:6010/;?type=http&nocache=1676417570"},
    {name = "Mushroom FM", url = "https://www.mushroomfm.com/media/listen.pls"},
    {name = "RNZ - Radio New Zealand Classic", url = "http://radionz-ice.streamguys.com/concert.mp3"},
    {name = "The Generator", url = "https://s1.myradiostream.com/:14268/;?type=http&nocache=1608640718?0.7458407789862892"},
    {name = "Hutt Radio 883FM", url = "https://stream.zeno.fm/argf5n7rbrruv"},
    {name = "KAOS Blenheim NZ", url = "http://74.91.125.187:8068/stream"},
    {name = "912 Oamaru FM", url = "https://usa1-vn.mixstream.net/8096/listen.mp3"},
    {name = "Tama-Ohi", url = "https://stream-162.zeno.fm/y4xnq17q068uv?zs=4tbvGUD1TfaydzO62IwtcQ"},
    {name = "Sounds Vagrant Radio", url = "https://admin.soundsvagrant.live/listen/sounds_vagrant/high.mp3"},
    {name = "Radio Samoa 1593Am", url = "http://radiosamoa.stream.broadcast.co.nz:8000/rsamoa48k"},
    {name = "Waves 961FM", url = "http://ais-nzme.streamguys1.com/nz_127/playlist.m3u8"},
    {name = "The Crush With DJ09", url = "http://ais-nzme.streamguys1.com/nz_045_aac"},
    {name = "CFM Coromandel", url = "https://stream.cfm.co.nz/low"},
    {name = "Te Arawa FM", url = "https://ais-nzme.streamguys1.com/nz_133/playlist.m3u8"},
    {name = "One Christian Radio", url = "https://radio.wanderingsheep.net:33001/onechristianradio"},
    {name = "West FM Swing Radio", url = "http://westfm.freeddns.org:8000/westfm"},
    {name = "Classic1027", url = "http://edge.iono.fm/xice/49_high.aac"},
    {name = "The Most FM 1044", url = "http://gordon.mostfm.com:8000/high"},
    {name = "MFM Te Reo O Te Iwi", url = "https://stream-150.zeno.fm/utfkkxfawp8uv?zs=K14ATu12TS2dc8uy0OiMBw"},
    {name = "Star", url = "http://rhema-radio.streamguys1.com/rhema-star.mp3"},
    {name = "Waatea 603Am", url = "https://ais-nzme.streamguys1.com/nz_138/playlist.m3u8?listeningSessionID=64a572b269dfcd0f_5154208_j9Ch6TXa_MjAyLjM3LjE0NS43NQ!!_0000000hgGt&downloadSessionID=0&aw_0_1st.playerid=iHeartRadioWebPlayer&aw_0_1st.skey=7591744858&clientType=web&companionAds=false&deviceName=web-desktop&dist=iheart&host=webapp.NZ&listenerId=&playedFrom=157&pname=live_profile&profileId=7591744858&stationid=8193&terminalId=162&territory=NZ"},
    {name = "The Station 1054FM", url = "https://ais-nzme.streamguys1.com/nz_125_aac"},
    {name = "Tiri 2", url = "https://servidor34-4.brlogic.com:7138/live?source=website"},
    {name = "Radio Redwood", url = "http://123.255.61.226:8020/;?type=http&nocache=76646"},
    {name = "The Pits FM 1077", url = "https://s1.voscast.com:11221/stream"},
    {name = "Chopper FM Southland 876", url = "https://s1.voscast.com:11235/stream"},
    {name = "Trucking Radio 247", url = "https://ais-nzme.streamguys1.com/nz_107/playlist.m3u8"},
    {name = "Smash 107FM", url = "https://s19.myradiostream.com/:18892/;?type=http&nocache=1653124007?0.30724640509725076"},
    {name = "Lake FM Taupo", url = "https://lakefm-gecko.radioca.st/stream"},
    {name = "Plains FM 969", url = "http://live.accessmedia.nz/plains.stream_aac/playlist.m3u8"},
    {name = "MAD FM Auckland 1067", url = "https://madfm-gecko.radioca.st/stream"},
    {name = "AWA FM", url = "https://wowza.iwi.radio/icecast-to-hls/ngrp:AwaFM.stream/playlist.m3u8"},
    {name = "Xs80S", url = "http://s1.myradiostream.com:12508/listen.mp3"},
    {name = "Arrow FM", url = "https://live.accessmedia.nz/ArrowFM.stream/playlist.m3u8"},
    {name = "2XS FM Palmerston North", url = "http://125.236.204.178:8001/listen.mp3"},
    {name = "TLC Radio Northland", url = "http://203.118.136.79:88/broadwave.mp3"},
    {name = "Turanga FM", url = "https://ais-nzme.streamguys1.com/nz_136/playlist.m3u8"},
    {name = "Radio - X", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/SAM02AAC65_SC?dist=onlineradiobox"},
    {name = "Moana Radio Tauranga", url = "https://ais-nzme.streamguys1.com/nz_140/playlist.m3u8"},
    {name = "Te Reo Irirangi O Ngāti Kahungunu", url = "https://wowza.iwi.radio/icecast-to-hls/ngrp:Kahungunu.stream/playlist.m3u8"},
    {name = "Radio Te Aroha 88FM", url = "https://c2.radioboss.fm:18440/stream"},
    {name = "Waiheke Radio 883", url = "https://s47.myradiostream.com:9962/listen"},
    {name = "Radio Spice Auckland, New Zealand", url = "http://stream9.broadcast.co.nz:8000/radiospicewebsiteaudio.mp3"},
    {name = "Power Hit FM 878 - Christchurch, NZ", url = "http://listen.powerhitfm.co.nz:16100/stream"},
    {name = "Country Radio Invercargilll", url = "http://countryradio2.no-ip.org:8000/;"},
    {name = "8KNZ", url = "http://radio8k.out.airtime.pro:8000/radio8k_a.m3u"},
    {name = "The ACC", url = "http://ais-nzme.streamguys1.com/nz_031/playlist.m3u8"},
    {name = "Central FM", url = "http://ais-nzme.streamguys1.com/nz_104/playlist.m3u8"},
    {name = "The Wireless 904 FM", url = "http://ais-nzme.streamguys1.com/nz_126/playlist.m3u8"},
    {name = "Radio Kidnappers", url = "https://live.accessmedia.nz/Kidnappers.stream_aac/playlist.m3u8"},
    {name = "Wandering Sheep Radio - Jazz Cafe", url = "http://radio.wanderingsheep.tv:8000/jazzcafe"},
    {name = "Sun FM 1065", url = "https://ais-nzme.streamguys1.com/nz_134/playlist.m3u8"},
    {name = "X", url = "https://digitalstreams-edge-lb.mediaworks.nz/chx_net/playlist.m3u8?"},
    {name = "Wellington Access Radio", url = "https://live.accessmedia.nz/Wellington.stream/playlist.m3u8"},
    {name = "Radio Woodville", url = "http://219.88.73.120:88/broadwave.mp3"},
    {name = "UP FM 1075", url = "https://stream.upfm.live/radio/8000/radio.mp3"},
    {name = "WCR 876 FM", url = "http://stream2.nrgkits.co.nz:5000/wcrfm"},
    {name = "Radio Hydra", url = "https://streaming.radio.co/sed9109681/listen"},
    {name = "RNZ Pacific 64Kbps", url = "http://radionz-ice.streamguys.com/international_aac64"},
    {name = "Tahifm", url = "https://radionz.streamguys1.com/tahi/tahi/tahi/tahi-mainstream/chunks.m3u8"},
    {name = "Galaxy 107 FM Kawerau", url = "http://s39.myradiostream.com:14858/;listen.mp3"},
    {name = "Https:Badradionz - 247 PHONK", url = "https://s2.radio.co/s2b2b68744/listen"},
    {name = "Radio Dunedin", url = "https://digitalstreams3.mediaworks.nz/radio-DUN-high/playlist.m3u8?listeningSessionID=65bb725f0839d341_2030585_0dgEALM4__0000000hKN6&downloadSessionID=0"},
    {name = "Anthemz 1009 Chch", url = "https://digitalstreams4.mediaworks.nz/anthemz-CHC-high/playlist.m3u8?listeningSessionID=65bb725f0839d341_2030720_iypaBLrq__0000000hKRf&downloadSessionID=0"},
    {name = "531 Pi", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/531PIAAC_SC?dist=onlineradiobox"},
    {name = "Radijohan", url = "http://69.30.214.54:13740/;?type=http&nocache=1708209708?0.5747864581171453"},
    {name = "RAG-FM 1077FM", url = "https://cast6.asurahosting.com/proxy/ragfmcom/stream"},
    {name = "True Light FM", url = "http://stream.truelightfm.co.nz:8000/mp3"},
    {name = "Https:Wwwnewstalkzbconz", url = "http://streaming.radiomyway.co.nz/zbakalt.pls"},
    {name = "Coast", url = "http://streaming.radiomyway.co.nz/coast2.pls"},
    {name = "OAR 1054FM Dunedin", url = "https://live.accessmedia.nz/Otago.stream/playlist.m3u8"},
    {name = "Rhema", url = "http://rhema-radio.streamguys1.com/rhema.mp3"},
    {name = "Paekakariki", url = "http://icecast.groundtruth.co.nz:8000/paekakfm.mp3.m3u"},
    {name = "The Most Fm", url = "http://gordon.mostfm.com:8000/high.m3u"},
    {name = "Libertynz On The Wireless", url = "https://stream.zeno.fm/lamr6x1fxrruv.pls"},
    {name = "Radio Wanaka 922 FM", url = "https://ais-nzme.streamguys1.com/nz_117/playlist.m3u8"},
    {name = "The Wireless Today'S Best Country", url = "https://stream.zeno.fm/lamr6x1fxrruv"},
    {name = "Ski FM", url = "https://s2.radio.co/s6436891bc/listen"},
    {name = "Wandering Sheep Radio - Hope Alive", url = "http://radio.wanderingsheep.tv:8012/hopealive"},
    {name = "Coast Access Radio MP3", url = "https://live.accessmedia.nz/Coast.stream/playlist.m3u8"},
    {name = "100,3FM South Canterbury", url = "http://uk4-vn.mixstream.net:8066/stream/1/"},
    {name = "Drop FM", url = "https://s2.radio.co/s7649837db/listen"},
    {name = "Radio Control 994FM", url = "https://michae14-gecko.radioca.st/stream"},
    {name = "The Generator FM", url = "https://s1.myradiostream.com/14268/stream/1/"},
    {name = "Q97", url = "https://radio.e-cast.co.nz/q97/stream.m3u8"},
    {name = "Arrow FM 927", url = "https://live.accessmedia.nz/ArrowFM.stream_aac/playlist.m3u8"},
    {name = "Freshfm", url = "https://live.accessmedia.nz/Fresh.stream_aac/chunklist_w1462567576.m3u8"},
    {name = "8KNZ || Christchurch, NZ", url = "http://radio8k.out.airtime.pro:8000/radio8k_a"},
    {name = "MIX FM Wellington", url = "https://stream.mixfm.nz/"},
    {name = "Mix", url = "https://ais-nzme.streamguys1.com/nz_012/playlist.m3u8"},
    {name = "Brianfm Marlborough", url = "https://ais-sa1.streamon.fm/7103_48k.aac/playlist.m3u8?aw_0_1st.playerid=esPlayer&aw_0_1st.skey=1590010609"},
    {name = "Iheart Australia - The Lounge - The Lounge -Laid Back In NZ", url = "http://ais-nzme.streamguys1.com/nz_000/playlist.m3u8"},
    {name = "Paekakariki 882FM", url = "https://icecast.groundtruth.co.nz/paekakfm.aac"},
    {name = "Coast Access Radio", url = "https://live.accessmedia.nz/Coast.stream_aac/playlist.m3u8"},
    {name = "RDU", url = "https://rdu985fm-gecko.radioca.st/stream"},
    {name = "Heads FM Mangawhai 1064", url = "https://headsfm.radioca.st/stream"},
    {name = "Ati Awa Toa FM", url = "https://ais-nzme.streamguys1.com/nz_144_aac"},
    {name = "Hokonui", url = "https://ais-nzme.streamguys1.com/nz_013_aac"},
    {name = "The Studio 881FM Dunedin", url = "http://s23.myradiostream.com/:16100/listen.mp3"},
    {name = "Total FM Dunedin 1073", url = "http://listen.totalfm.nz:8000/stream"},
    {name = "Oamaru Heritage Radio", url = "http://202.9.116.204:8000/ohrweb"},
    {name = "Radio Ngāti Porou", url = "https://wowza.iwi.radio/icecast-to-hls/ngrp:NgatiPorou.stream/playlist.m3u8"},
    {name = "RNZ Parliament", url = "http://radionz-ice.streamguys.com/parliament.mp3"},
    {name = "The Flea FM 882", url = "http://49.50.246.42:8020/listen.pls"},
    {name = "ZFM Global", url = "http://nebula.shoutca.st:8545/stream/1/"},
    {name = "Roy FM 946", url = "https://ais-nzme.streamguys1.com/nz_121/playlist.m3u8"},
    {name = "Cool Blue Taupo", url = "http://falcon.shoutca.st:8166/stream"},
    {name = "Big River FM", url = "http://bigriver.broadcast.co.nz/bigriverfm.mp3"},
    {name = "Radio Central", url = "https://stream.radioapp.co.nz/radiocentral"},
    {name = "Radio Hawkes Bay", url = "https://live.accessmedia.nz/Kidnappers.stream/playlist.m3u8"},
    {name = "Bay FM 1007", url = "https://s38.myradiostream.com:8876/;;?listening-from-radio-garden=1686796930"},
    {name = "Compass FM", url = "http://stream.compassfm.org.nz:8000/Compass_FM_104.9"},
    {name = "Mouthfull Radio", url = "https://mouthfull-radio.radiocult.fm/stream"},
    {name = "MPR Manawatu People'S Radio", url = "https://live.accessmedia.nz/MPR.stream/playlist.m3u8"},
    {name = "The Rhythm 89FM", url = "http://stream.zeno.fm/7v9aaqeqhs8uv"},
    {name = "One Double-X", url = "https://radio.e-cast.co.nz/1xxone/stream.m3u8"},
    {name = "Access Radio Taranaki 1044FM", url = "https://live.accessmedia.nz/Taranaki.stream_aac/playlist.m3u8"},
    {name = "Free FM 89 Hamilton", url = "https://live.accessmedia.nz/FreeFM.stream_aac/chunklist_w1448621681.m3u8"},
    {name = "Positively Morrinsville 877FM", url = "https://c16.radioboss.fm:8262/stream?1652324863134"},
    {name = "Heads 1064 FM - Mangawhai Heads", url = "http://ais-nzme.streamguys1.com/nz_106/playlist.m3u8"},
    {name = "Radioactivefm 886", url = "https://radio123-gecko.radioca.st/radioactivefm"},
    {name = "Radio Bay FM 1007", url = "https://s38.myradiostream.com:8876/;;?listening-from-radio-garden=1686969300"},
    {name = "World FM Tawa 882", url = "http://www.worldfm.co.nz:8882/worldfm.aac"},
    {name = "Niu FM", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/NIUFM.mp3?dist=onlineradiobox"},
    {name = "Jakemusic", url = "https://camera.jakebriggs.com/jakemusic"},
}

return stations
