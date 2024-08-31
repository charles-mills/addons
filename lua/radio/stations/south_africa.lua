local stations = {
    {name = "Ukhozi FM SA", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/UKHOZIFMAAC_SC?dist=triton-widget&pname=tdwidgets"},
    {name = "Metro FM SA", url = "https://27993.live.streamtheworld.com/METROFMAAC.aac?dist=triton-widget&tdsdk=js-2.9&swm=false&pname=tdwidgets&pversion=2.9&banners=none&burst-time=15&sbmid=496fec8c-5809-460a-beb7-3545115118ca"},
    {name = "Thobelafm", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/THOBELAAAC.aac"},
    {name = "Jacaranda FM", url = "https://edge.iono.fm/xice/jacarandafm_live_medium.aac"},
    {name = "Bosveld Stereo", url = "http://capeant.antfarm.co.za:8000/Bosveld"},
    {name = "Power 987", url = "https://edge.iono.fm/xice/65_medium.aac"},
    {name = "702 Talk Radio Johannesburg", url = "https://23543.live.streamtheworld.com/FM702AAC.aac"},
    {name = "Amapiano FM", url = "https://stream.zeno.fm/xs6zeac1ts8uv"},
    {name = "RSG", url = "http://25443.live.streamtheworld.com/RSGAAC.aac?dist=triton-widget&tdsdk=js-2.9&pname=tdwidgets&pversion=2.9&banners=none&burst-time=15&sbmid=05b99128-657f-4c70-b58c-df652bf26291"},
    {name = "Kfm", url = "http://25583.live.streamtheworld.com/KFM_SC"},
    {name = "KAYA FM 959", url = "http://edge.iono.fm/xhls/82_high.m3u8"},
    {name = "Radio 2000 SABC", url = "http://25483.live.streamtheworld.com/RADIO2000AAC.aac?dist=triton-widget&tdsdk=js-2.9&pname=tdwidgets&pversion=2.9&banners=none&burst-time=15&sbmid=3e99e625-68d3-4273-8866-a73f7d8fe4d8"},
    {name = "947", url = "http://playerservices.streamtheworld.com/m3u/FM947.m3u"},
    {name = "YFM", url = "http://streaming.fabrik.fm/yfm/echocast/audio/index.m3u8"},
    {name = "Jacaranda", url = "https://live.jacarandafm.com/jacarandahigh.mp3"},
    {name = "LM Radio South Africa", url = "http://cast.fabrik.fm:8008/"},
    {name = "Pretoria FM", url = "http://capeant.antfarm.co.za:8000/ptafm"},
    {name = "702 Johannesburg", url = "http://playerservices.streamtheworld.com/m3u/FM702.m3u"},
    {name = "Jozi FM", url = "https://edge.iono.fm/xice/51_medium.aac"},
    {name = "Groot FM", url = "https://cast3.my-control-panel.com/proxy/grootfm/stream?1682362396578"},
    {name = "Bokradio", url = "http://bokradio.highquality.radiostream.co.za/"},
    {name = "Ubuntufm", url = "https://streaming.coollective.nl:8443/UbuntuFM"},
    {name = "Hot 1027 FM", url = "https://edge.iono.fm/xice/57_high.aac"},
    {name = "KFM 945", url = "https://25483.live.streamtheworld.com/KFM_192AAC.aac"},
    {name = "Hot 1027FM", url = "https://edge.iono.fm/xice/57_medium.aac?ref=https%3A%2F%2Fhot1027.co.za%2F&adToken="},
    {name = "JOY GOSPEL RADIO", url = "https://servidor17.brlogic.com:7012/live"},
    {name = "5FM", url = "http://25483.live.streamtheworld.com/5FMAAC.aac"},
    {name = "Radio 786", url = "http://stream.krypton.co.za:8040/stream/"},
    {name = "Capital Radio 604", url = "https://stream.galaxywebsolutions.com/proxy/capitalradio604?mp=%2Fstream"},
    {name = "Mix 938 FM", url = "https://edge.iono.fm/xice/113_medium.aac"},
    {name = "Box Afrofusion Amapiano", url = "https://play.streamafrica.net/afrofusionamp"},
    {name = "ECR - East Coast Radio -Kwazulu Natal", url = "https://edge.iono.fm/xice/ecr_live_medium.aac"},
    {name = "East Coast Radio", url = "https://live.ecr.co.za/ecrhigh.mp3?aw_0_pinpoll=1,2,9&listenerid=94d1ac3bf877b65e4e17cd7e9bfec132&awparams=companionAds%3Atrue&aw_0_1st.ri=iono"},
    {name = "Tygerberg 104FM", url = "http://zas6.ndx.co.za:8007/"},
    {name = "Capricorn FM", url = "http://edge.iono.fm/xice/67_medium.aac"},
    {name = "Radio 2000", url = "http://27743.live.streamtheworld.com/RADIO2000AAC.aac?dist=triton-widget&tdsdk=js-2.9&swm=false&pname=tdwidgets&pversion=2.9&banners=none&burst-time=15&sbmid=8310c16e-1928-4209-9339-97787465358b"},
    {name = "Express-Fm Digital", url = "http://198.7.59.28:34235/stream"},
    {name = "Magic 828", url = "http://cast.fabrik.fm:8106/"},
    {name = "Lekker FM", url = "https://zas3.ndx.co.za:8002/stream"},
    {name = "Starfm", url = "https://edge.iono.fm/xice/112_medium.aac"},
    {name = "947 Highveld Stereo", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/FM947_SC"},
    {name = "Smile 904 FM", url = "https://edge.iono.fm/xice/212_medium.aac"},
    {name = "Algoa FM", url = "http://edge.iono.fm/xice/54_high.mp3"},
    {name = "Izwi Lomzansi", url = "https://streaming.fabrik.fm/izwi/echocast/audio/index.m3u8"},
    {name = "Bok Radio", url = "https://bokradio.highquality.radiostream.co.za/"},
    {name = "Classic FM 1027", url = "http://edge.iono.fm/xice/49_medium.aac?p=embed"},
    {name = "OFM 94 97 FM Bloemfontein", url = "http://edge.iono.fm/xice/ofm_live_medium.aac"},
    {name = "Harties FM", url = "https://s5.radio.co/s68c6f4028/listen"},
    {name = "Ubuntufm Africa", url = "https://streaming.coollective.nl:8443/UbuntuFMafrica"},
    {name = "LM Radio", url = "https://streaming.fabrik.fm/lm-radio/echocast/audio/low/index.m3u8"},
    {name = "Radio Pulpit", url = "https://edge.iono.fm/xice/189_medium.aac?ref=https%3A%2F%2Fwww.radiopulpit.co.za%2F&adToken="},
    {name = "SAFM", url = "http://25433.live.streamtheworld.com/SAFMAAC.aac?dist=triton-widget&tdsdk=js-2.9&swm=false&pname=tdwidgets&pversion=2.9&banners=none&burst-time=15&sbmid=8af09f6c-1528-4186-9e2b-4f0275cc87b9"},
    {name = "Channel Islam International", url = "http://edge.iono.fm/xice/109_medium.aac"},
    {name = "Emzini Fm Radio", url = "http://stream.zeno.fm/2kbssevq5tjvv"},
    {name = "Ilizwi Fm", url = "https://sv2.famcast.co.za/proxy/ilizwi_fm/stream"},
    {name = "Cape Talk", url = "http://playerservices.streamtheworld.com/m3u/CAPE_TALK.m3u"},
    {name = "Bloem Radio Digital", url = "https://9300.co.za/listen/bloem_radio_digital/radio.mp3"},
    {name = "Pep Feel Good Fm", url = "https://edge.iono.fm/xice/feelgood_live_high.aac"},
    {name = "African Praise Radio", url = "https://fastcast4u.com/player/africanpraiserad/?pl=winamp&c=African%20Praise%20Radio"},
    {name = "HOT 919", url = "http://edge.iono.fm/xice/57_medium.mp3"},
    {name = "Eastwave FM 922", url = "http://uk5freenew.listen2myradio.com:12817/;"},
    {name = "Radio Islam International", url = "http://listen.radioislam.co.za:8080/radioislam.mp3"},
    {name = "CCFM 1075", url = "https://edge.iono.fm/xice/69_medium.aac"},
    {name = "Kaya FM", url = "https://edge.iono.fm/xice/82_medium.aac"},
    {name = "RADIO NAMAKWALAND", url = "https://zas3.ndx.co.za:8034/stream"},
    {name = "Joyful FM", url = "http://c15.radioboss.fm:8218/stream"},
    {name = "Hot 1027 FM Club", url = "https://edge.iono.fm/xice/306_high.aac"},
    {name = "Lister FM", url = "http://www.adhocstreaming.co.za:8000/LuisterFM"},
    {name = "IFM 1022", url = "http://s7.voscast.com:9538/;stream1700094931336/1"},
    {name = "Orania Radio", url = "https://eclipse-radio2.eclipse-streaming.co.za/listen/radio_orania/radio.mp3"},
    {name = "Gaysa Radio", url = "https://zas1.ndx.co.za:8018/stream"},
    {name = "Talk Radio 702", url = "https://playerservices.streamtheworld.com/api/livestream-redirect/FM702_192AAC.aac"},
    {name = "Al-Ansaar Radio", url = "https://al-ansaar.simplestreaming.co.za/radio/8000/radio.mp3"},
    {name = "Loca FM", url = "https://s3.we4stream.com:2020/stream/locafm"},
    {name = "Helderberg FM", url = "https://helderberg.highquality.radiostream.co.za/"},
    {name = "Simply Making Success Radio", url = "https://stream.zeno.fm/ylvoyhv6tbntv"},
    {name = "Katlego Fm", url = "https://streaming.live365.com/a26642"},
    {name = "Ballito 88 FM - Radio Life Style", url = "https://edge.iono.fm/xhls/165_high.m3u8"},
    {name = "Heaven FM", url = "https://stream.zeno.fm/eequgfw72hhvv"},
    {name = "Faithofgodseedchurch", url = "http://stream.laut.fm/faithofgodseedchurch.pls"},
    {name = "TAMBO FM", url = "https://listen.radioking.com/radio/326599/stream/374668?fbclid=IwAR3lWR7ZdVVmZBSBedW_Cv1xF_Q7KzGmUQ0stgVCc_A7kx8Cf3Ncek1ntxk"},
    {name = "RISE FM", url = "https://edge.iono.fm/xice/73_medium.aac?ref=https%3A%2F%2Frisefm.co.za%2F&adToken="},
    {name = "East Coast Gold", url = "https://live.ecr.co.za/ecrgoldhigh.mp3"},
    {name = "Rainbow FM", url = "https://edge.iono.fm/xice/237_low.aac"},
    {name = "AGANANG FM", url = "https://streaming.fabrik.fm/aganangfm/echocast/audio/low/index.m3u8?session_id=1pbxzwxy1RWaVFv&device_id=Q7fauplH"},
    {name = "Radio Free Tankwa", url = "https://samcloud.spacial.com/api/listen?sid=69819&m=sc&rid=155682"},
    {name = "Link FM RSA-EC", url = "https://de2.streamingpulse.com/ssl/LinkFM"},
    {name = "Jozi FM Hifi Aac", url = "https://edge.iono.fm/xice/51_high.aac"},
    {name = "Kurara FM", url = "https://stream.zeno.fm/gvmschcf9yzuv"},
    {name = "Uniquefive HD Radio", url = "http://stream.zeno.fm/a4t818ymva0uv"},
    {name = "Chai FM", url = "https://zas1.ndx.co.za:8008/stream?1702143258610"},
    {name = "Jakaranda FM", url = "https://edge.iono.fm/xice/jacarandafm_live_high.mp3"},
    {name = "KM RADIO", url = "https://centova.hostingelectrica.net/proxy/kmradio?mp=/stream&1704296313782"},
    {name = "SFM Streek Radio", url = "http://capeant.antfarm.co.za:8000/SFM"},
    {name = "Trufm SABC", url = "http://25483.live.streamtheworld.com/TRUFMAAC.aac?dist=triton-widget&tdsdk=js-2.9&swm=false&pname=tdwidgets&pversion=2.9&banners=none&burst-time=15&sbmid=ccfa99e2-501e-41aa-ba19-701128ad7a93"},
    {name = "Radio Islam", url = "http://stream.radioislam.org.za:7542/radioislam.mp3"},
    {name = "Perron FM", url = "https://zas7.ndx.co.za:8044/stream?1694973588521"},
    {name = "919", url = "https://edge.iono.fm/xice/112_low.aac"},
    {name = "Salaammedia", url = "https://iceant.antfarm.co.za/Salaam"},
    {name = "Impala Radio", url = "https://maggie.torontocast.com:8014/stream"},
    {name = "Hellenic Radio", url = "http://iceant.eclipse-streaming.co.za/Hellenic"},
    {name = "Radio Fynbos - Stilbaai", url = "https://stream-152.zeno.fm/w0cyqt4cyy8uv?zs=KrkViuxOTr6gZl4perU1jA"},
    {name = "PSH Radio", url = "https://radio2.whazup.mobi/listen/psh_radio/pshlive.aac?1725024971931"},
    {name = "Radio Turf 1038 FM", url = "https://sv2.famcast.co.za/proxy/radioturf/stream"},
    {name = "Sky Alpha HD", url = "https://sv2.famcast.co.za/proxy/skyalphahd?mp=/stream"},
    {name = "Viva Nation Radio", url = "https://servidor34-3.brlogic.com:7056/live?source=website"},
    {name = "Replay Radio", url = "http://stream.zeno.fm/a5r2rwnnffhvv"},
    {name = "Cape Town Classic", url = "https://edge.iono.fm/xhls/fmr_live_high.m3u8"},
    {name = "Salaam Media", url = "http://capeant.antfarm.co.za:1935/salaam/salaam.stream/chunklist_w1196116988.m3u8"},
    {name = "Radio Veritas", url = "https://zas5.ndx.co.za:9618/stream?1722433923032"},
    {name = "MFM", url = "https://edge.iono.fm/xice/46_medium.aac"},
    {name = "Radio Orania", url = "https://saukradio.com/wp-content/uploads/2021/07/5-Julie-Orania.mp3"},
    {name = "Fine Music Radio", url = "http://edge.iono.fm/xhls/fmr_live_medium.m3u8"},
    {name = "Pitch Radio", url = "http://stream.zeno.fm/etw8vx9knm0uv"},
    {name = "NCDOH Radio The Healthy Sound From Northern Cape Department Of Health", url = "https://stream-154.zeno.fm/grjnbwcxbneuv"},
    {name = "Jacarandahigh", url = "https://edge.iono.fm/xice/jacarandafm_live_high.aac"},
    {name = "SAFFA Onair World Radio", url = "http://stream.zeno.fm/k8cqvwu2za0uv"},
    {name = "Tuks FM", url = "http://edge.iono.fm/xice/tuksfm_live_medium.aac"},
    {name = "Mabopane Rise Radio", url = "https://stream.zeno.fm/kyap8zs093yvv"},
    {name = "Cliff Central", url = "https://edge.iono.fm/xice/cliffcentral_live_medium.aac"},
}

return stations
