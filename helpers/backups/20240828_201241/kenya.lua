local stations = {
    {name = "#0#", url = "http://stream.zeno.fm/65sw1gyst5quv"},
    {name = "#Radio Quran", url = "https://n0a.radiojar.com/0tpy1h0kxtzuv?rj-ttl=5&rj-tok=AAABhdgGORQA-2acfyF3_4WY2g"},
    {name = "Adventist Angels Watchman Radio", url = "http://stream.zeno.fm/7wh3uauhunhvv"},
    {name = "ALLIZINIC FM", url = "http://allzic43.ice.infomaniak.ch/allzic43.mp3"},
    {name = "Baze Radio", url = "https://n10.radiojar.com/h831kbtdm3hvv"},
    {name = "Bomet Worship Radio", url = "http://stream.zeno.fm/v7ngcbhmb78uv"},
    {name = "Campus Radio Kenya", url = "https://stream.zenolive.com/mayn36v1v8quv.aac"},
    {name = "CARRIBEAN", url = "https://streams.rautemusik.fm/caribbean-wave/mp3-192/"},
    {name = "Classic", url = "http://media-ice.musicradio.com/ClassicFMMP3"},
    {name = "CORO FM KENYA", url = "https://stream.zeno.fm/65sw1gyst5quv"},
    {name = "Creative Family Radio", url = "https://stream.zeno.fm/rjpsi0i6sfguv"},
    {name = "Creative Kove Halla", url = "https://stream.zeno.fm/zzfm7bz4668uv"},
    {name = "Exclusive Radio George Straight", url = "https://streaming.exclusive.radio/er/georgestrait/icecast.audio"},
    {name = "Family Radio 316", url = "https://listen-familymedia.sharp-stream.com/familymedia.mp3"},
    {name = "FEEL JAH", url = "http://solid9.streamupsolutions.com:8018/stream"},
    {name = "FM CORO KENYA", url = "http://stream-64.zeno.fm/65sw1gyst5quv?zs=fGWGr4UPR1uqgePZLU-62w"},
    {name = "FM RASSTYLE KENYA", url = "http://stream.zeno.fm/gf58b0pt5x8uv"},
    {name = "George Jones", url = "https://streaming.exclusive.radio/er/georgejones/icecast.audio"},
    {name = "GHETT", url = "http://stream.zeno.fm/kvudezx1h2zuv"},
    {name = "Ghett Kenya", url = "http://stream-27.zeno.fm/kvudezx1h2zuv?zs=hCl2Q4ZVSPykhlahMviRpQ"},
    {name = "Ghetto Kenya", url = "https://stream.zeno.fm/kvudezx1h2zuv"},
    {name = "GHETTOKE KENYA", url = "http://stream-47.zeno.fm/gf58b0pt5x8uv?zs=9Rb0nsM4TlCJ9aggk8nWAg"},
    {name = "GHETTOO KENYA", url = "http://stream.zeno.fm/cs4q33arb2zuv"},
    {name = "GMA News TV International HD", url = "https://stream.gmanews.tv/ioslive/livestream/playlist.m3u8"},
    {name = "Heaven FM Radio", url = "http://stream.zeno.fm/eequgfw72hhvv"},
    {name = "High-Rise Fm", url = "https://stream.zeno.fm/nezypbz4668uv"},
    {name = "IRIE FM JAMAICA", url = "http://stream.zeno.fm/6zszyw9tarzuv"},
    {name = "JEMBE FM", url = "https://cast3.asurahosting.com/proxy/jembemed/stream"},
    {name = "Jesus Is LORD Radio", url = "https://s3.radio.co/s97f38db97/listen"},
    {name = "Juja FM", url = "http://node-10.zeno.fm/5w8y7wcf9x8uv?zs=xwoBg8DVTx2jYRhHsWgHXw&rj-ttl=5&rj-tok=AAABgnKqVSgAmEHnh12jXuZhAw"},
    {name = "Juraini Radio", url = "http://stream.zeno.fm/fe0nc58z8vzuv"},
    {name = "Kass FM", url = "http://media.kassfm.co.ke:8006/live"},
    {name = "KBC", url = "http://stream.zeno.fm/ud2u96xst5quv"},
    {name = "KBC English Service", url = "https://stream-163.zeno.fm/mhmwnyyst5quv?zs=QUtGPYxDTYOzZzhu5oNcfA"},
    {name = "KENYA1 FM", url = "https://stream.zeno.fm/cmgkmed5u18uv"},
    {name = "KINGSTONE", url = "http://198.57.187.102:8080/kingston12"},
    {name = "Lubao FM", url = "http://41.90.240.222:88/broadwave.mp3"},
    {name = "Magik FM 1073", url = "https://stream.zeno.fm/pkpx3623cy8uv"},
    {name = "MAISHA", url = "http://stream.zeno.fm/0nb1sqerqy5tv"},
    {name = "MWANGAZA WA NENO FM KENYA", url = "https://stream.zeno.fm/e34h1cbrmeruv"},
    {name = "NATION FM", url = "http://stream.radiojar.com/3by7s8eg65quv"},
    {name = "Nguono Fm", url = "https://stream.zeno.fm/zopr3xxetftvv.m3u"},
    {name = "NRG FM", url = "https://streamingv2.shoutcast.com/nrg-radio-ke"},
    {name = "NRG Gospel", url = "https://uksoutha.streaming.broadcast.radio/nrggospel"},
    {name = "Pearl Radio Ke", url = "https://stream-160.zeno.fm/che1shhs8mruv?zs=3Yxi8tThTMyIVE9gVOXTtQ"},
    {name = "R", url = "http://rootslegacy.fr:8080/listen1"},
    {name = "R MARIA KENYA", url = "http://dreamsiteradiocp2.com:8092/"},
    {name = "Radio Kaya", url = "http://usa9-vn.mixstream.net:8084/;"},
    {name = "Radio Maria Kenya - Nairobi", url = "http://dreamsiteradiocp5.com:2199/tunein/rmkenyanai-stream.pls"},
    {name = "Radio Maria Kenya - Nyeri", url = "http://dreamsiteradiocp2.com:2199/tunein/rmkenya2-stream.pls"},
    {name = "Radio Maria Kenya Kisumu", url = "http://dreamsiteradiocp5.com:2199/tunein/rmkenyakisumu-stream.pls"},
    {name = "Radio Maria Kenya-Murang'A", url = "http://dreamsiteradiocp2.com:2199/tunein/rmkenyamuranga-stream.pls"},
    {name = "RASSS KENYA", url = "http://stream-57.zeno.fm/gf58b0pt5x8uv?zs=_88r_Fp8TmC34vmgpzzmzQ"},
    {name = "RASTYLE KENYA", url = "http://stream-57.zeno.fm/gf58b0pt5x8uv?zs=vvcdeoPjSamesknSTOXHvQ"},
    {name = "REGGAE ROOTS", url = "http://relay5.181.fm:8096/"},
    {name = "REGGAE TRADE", url = "http://sc1c-sjc.1.fm:7078/"},
    {name = "SENSIMEDIA", url = "http://rsal2301.radioca.st:9878/"},
    {name = "Sound Asia FM", url = "http://41.72.210.222:88/stream?1683449693737"},
    {name = "Tzgospel Malawi", url = "https://stream.zeno.fm/77d0z2c6schvv"},
    {name = "Zoza Radio", url = "https://stream-153.zeno.fm/vp6qzta3pnhvv?zs=Gjwa-PX6TFa5dVY3KEcoTg&listening-from-radio-garden=1694879018"},
}

return stations
