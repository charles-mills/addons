local stations = {
    {name = "Dj Shaggy Venezuela", url = "http://51.255.123.116:9226/"},
    {name = "Rocafm Clasicos Caracas", url = "http://protostar.shoutca.st:8370/"},
    {name = "DJ Shaggy Venezuela Radio", url = "https://laradiossl.online:9226/;"},
    {name = "Baladas Y Algo Mas", url = "http://streamingned.com:7286/;"},
    {name = "RNV Activa", url = "http://rnv.lorini.net:29010/RNVACTIVA"},
    {name = "RNV Informativo", url = "http://rnv.lorini.net:29100/RNVINFORMATIVO"},
    {name = "Radio Nacional De Venezuela", url = "http://rnv.lorini.net:29100/RNVINFORMATIVO"},
    {name = "Tu Amiga Radio", url = "https://audio0stream.com:8010/turadioamiga"},
    {name = "Radio 2000", url = "https://streaming.adclichosting.com:8030/radio2000.mp3"},
    {name = "Circuito X", url = "http://cp2.lorini.net:39500/stream"},
    {name = "Radioalterna", url = "https://server01.heplayer.com:7027/"},
    {name = "Calle FM", url = "https://cloudstream2030.conectarhosting.com/8076/;"},
    {name = "Telesur", url = "https://cdnesmain.telesur.ultrabase.net/mbliveMain/audio/playlist.m3u8"},
    {name = "Telesur Audio", url = "https://cdnesmain.telesur.ultrabase.net/mbliveMain/audio/playlist.m3u8"},
    {name = "Maxi Radio Digital", url = "https://guri.tepuyserver.net/8010/stream"},
    {name = "Radio Dinámica 1490AM", url = "https://guri.tepuyserver.net/8040/stream"},
    {name = "RADIO EDUCATIVA DE VENEZUELA", url = "https://stream-172.zeno.fm/8vd9wvkvv8jvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI4dmQ5d3ZrdnY4anZ2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Imk2SkdkN1FEUWFpZHZBbVZUWVNoaXciLCJpYXQiOjE3MjQ2NzE3NTcsImV4cCI6MTcyNDY3MTgxN30.GrvHN6iZiFpgb6oV7wt1PyN8MITLJC9HhVXNZai3jlc"},
    {name = "CANAIMA STEREO", url = "https://stream-174.zeno.fm/cd7isb0ojlruv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJjZDdpc2Iwb2pscnV2IiwiaG9zdCI6InN0cmVhbS0xNzQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjVZRE9kNWpBVHVxcmZScFRwVy1sUEEiLCJpYXQiOjE3MjQ3MDI2MjksImV4cCI6MTcyNDcwMjY4OX0.RH7xJkKvgvzhaCaogfJwve8At2cRrZ92D9D8yNGylrw"},
    {name = "Zona Musical Fm", url = "https://stream-171.zeno.fm/t9fhqcsiao2uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0OWZocWNzaWFvMnV2IiwiaG9zdCI6InN0cmVhbS0xNzEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IlJxZmR2REJjUkoyaXNla21NQl9QSXciLCJpYXQiOjE3MjQ2NzgxNzIsImV4cCI6MTcyNDY3ODIzMn0.VTZpIKll3MmLihgCD66gQFjVIbmoNJhdSab3dXR6aKY"},
    {name = "Espacio Network", url = "https://acp2.lorini.net:28050/stream"},
    {name = "RQ 910 AM", url = "http://streaming3.globalhost.net.ve:9014/stream"},
    {name = "Redpres Radio", url = "https://stream-171.zeno.fm/qjgbevaswlfuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJxamdiZXZhc3dsZnV2IiwiaG9zdCI6InN0cmVhbS0xNzEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjlMWjBiY3EwUU5XTGZoTjBCUkh2RHciLCJpYXQiOjE3MjQ2NzgyOTEsImV4cCI6MTcyNDY3ODM1MX0.yY0MEEgjW5kQ00XlmQXbEaMVH0yuQ_iuBOev1EfT2rs"},
    {name = "RADIO RUMBOS 670 AM", url = "https://stream-161.zeno.fm/c3q3w8zfe18uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJjM3Ezdzh6ZmUxOHV2IiwiaG9zdCI6InN0cmVhbS0xNjEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InhZcTVBaG43UnBLaXRFWVBUbTlPVEEiLCJpYXQiOjE3MjQ3MDA4NTgsImV4cCI6MTcyNDcwMDkxOH0.qUyCswNjAzRL7Im3d8rjb7ImL5UjYKuJx-p7tGkoRUg&triton-uid-cookie%3A0fae79a4-e789-4b9b-9ca7-d30ae705f0a6"},
    {name = "Cool Radio Web", url = "https://stream-173.zeno.fm/omuwlrerlxhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJvbXV3bHJlcmx4aHZ2IiwiaG9zdCI6InN0cmVhbS0xNzMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Im14R1RkQXhHUTd5TEsxeFB5QXRoRkEiLCJpYXQiOjE3MjQ2ODg5MjEsImV4cCI6MTcyNDY4ODk4MX0.bfpJyRWCnDmehQv4rCGjufGhmc9kcq829TMl7S2OxcM"},
    {name = "Exa FM", url = "https://27063.live.streamtheworld.com:443/XHPSFMAAC.aac"},
    {name = "VTV Venezuela", url = "https://radio.gmsiptv.com/vtvve"},
}

return stations
