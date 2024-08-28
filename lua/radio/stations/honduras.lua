local stations = {
    {name = "NUEVA VISIÓN 883 FM", url = "http://159.69.43.96:9304/;"},
    {name = "GD Dubai", url = "https://nl4.mystreaming.net:443/er/gratefuldead/icecast.audio"},
    {name = "ABC Radio AM 550 FM 897", url = "http://137.184.101.169:8000/radio.mp3"},
    {name = "Stereo San Juan", url = "https://radios.sisc-tech.com:8020/radio.mp3"},
    {name = "HRYW 959 Radio Panamericana - Tegucigalpa", url = "http://online.radiodifusion.net:1935/panam-hn/panam.stream/master.m3u8"},
    {name = "Stereo Exitos 881 Tegucigalpa", url = "http://ice42.securenetsystems.net/EXITOS"},
    {name = "94 SU FM 941 Tegucigalpa", url = "http://ice42.securenetsystems.net/94SUFM"},
    {name = "XY 905 FM - Tegucigalpa, Honduras", url = "http://ice42.securenetsystems.net/XY905"},
    {name = "Cristal FM 889", url = "https://cristalfm-zikoxweb.radioca.st/;"},
    {name = "Radio Radical", url = "https://stream-172.zeno.fm/vcumd3susq5vv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ2Y3VtZDNzdXNxNXZ2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImgwM3VLZFp0VHBpZ2dvNXdqRkwtNEEiLCJpYXQiOjE3MjQ4NDQ0NjgsImV4cCI6MTcyNDg0NDUyOH0.12xMEtVZ76Y64u_KEG_IKN4SnPLlzk2YzxPsakxxvjc"},
    {name = "Suave FM 1025 Tegucigalpa", url = "http://ice42.securenetsystems.net/SUAVE"},
    {name = "Cortés FM 1057", url = "https://cortesfm-zikoxweb.radioca.st/;"},
    {name = "Cortes FM", url = "https://cortesfm-zikoxweb.radioca.st/stream/1/"},
    {name = "DCR Difusora Cristiana De Radio 1031 FM", url = "http://stream.playerlive.info:8165/"},
    {name = "Radio W107 1073 Tegucigalpa", url = "http://ic.streann.com:8000/w107"},
    {name = "Master FM 969", url = "https://stream-154.zeno.fm/0c8utm1cckhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIwYzh1dG0xY2NraHZ2IiwiaG9zdCI6InN0cmVhbS0xNTQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImV6akdoNl9WVF9pYXBPemFuNGdaTnciLCJpYXQiOjE3MjQ3ODg1MTYsImV4cCI6MTcyNDc4ODU3Nn0.EaH5xv0yjUG7q59c6QQ4wHQFp7Ez57un9t-CHErCfyM"},
    {name = "Cadena Radial Del Centro 897 FM", url = "https://sonic.portalfoxmix.cl/8442/stream"},
    {name = "Estereo Sur 913 FM", url = "https://cast.az-streamingserver.com/proxy/estereosur2?mp=/stream"},
    {name = "Stereo Fe Tegucigalpa 989 FM - San Pedro Sula 1009 FM - Comayagua 1059 FM - Danlí 1063 FM - Choluteca 1007 FM", url = "https://media.cdebs.com/8008/stream"},
    {name = "Metrodigital Radio", url = "https://stream-152.zeno.fm/z9ugz9vsqfhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ6OXVnejl2c3FmaHZ2IiwiaG9zdCI6InN0cmVhbS0xNTIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjI4SHN4cFVJUkxpWWVVZ2pIcGxHNEEiLCJpYXQiOjE3MjQ4MzYyODYsImV4cCI6MTcyNDgzNjM0Nn0.s522AMQMgrnJg18_wK-qI9_KChYVsRdgjicgXFRZkII"},
    {name = "Stereo Dimensión - La 96", url = "https://rr5100.globalhost1.com:7328/stream"},
    {name = "La Top 1029 FM - San Pedro Sula, Honduras", url = "https://us9.maindigitalstream.com/ssl/latop102"},
    {name = "Stereo Cafe 1003 FM", url = "https://stream-171.zeno.fm/vt667xqryd0uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ2dDY2N3hxcnlkMHV2IiwiaG9zdCI6InN0cmVhbS0xNzEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IlhTUktrbVVrVGZ1bWdjTkFkMExOZ0EiLCJpYXQiOjE3MjQ4NTAyNzUsImV4cCI6MTcyNDg1MDMzNX0.Y0TzU4cYBe1XgDYiqvSAthsVAvY4EZWfH_oMR8gtzzo"},
    {name = "1 FM Hits Radio", url = "https://stream-153.zeno.fm/yg1gkzwabzzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ5ZzFna3p3YWJ6enV2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjQyZTZuaERPUTUtMGxFbEcyakVsR0EiLCJpYXQiOjE3MjQ3OTY2ODMsImV4cCI6MTcyNDc5Njc0M30.3cuzQh7zgNzEeVTA8odQBxh79cUwediBHJS0V8aGghc"},
    {name = "LA RADIO GLOBAL", url = "https://sonicpanel.us/8022/stream"},
    {name = "Vinilo FM Honduras", url = "https://stream-152.zeno.fm/xwextarnscluv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ4d2V4dGFybnNjbHV2IiwiaG9zdCI6InN0cmVhbS0xNTIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ii1CeGtNZm1MVGRDN2x3SC1JUHJKMXciLCJpYXQiOjE3MjQ3NzAyNzcsImV4cCI6MTcyNDc3MDMzN30.3XSerTkkCPdZOtOXuQxkhEkX0l9fUM1PpDZOXTG2LWU"},
    {name = "RNH", url = "https://stream-159.zeno.fm/mb5f69fk0d0uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJtYjVmNjlmazBkMHV2IiwiaG9zdCI6InN0cmVhbS0xNTkuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ikl5QXRsTHI4Uk8yblB5MGx2V1dQX0EiLCJpYXQiOjE3MjQ4NDA2MDEsImV4cCI6MTcyNDg0MDY2MX0.CnT_edf3LJdUBW5zp6YklrF9ifcEcb02-Z-U-DoyC2M"},
    {name = "Girasol Stereo 1023 FM", url = "https://stream.playerlive.info:8037/live.aac"},
    {name = "Encuentro Digital 1043 FM", url = "https://stream-153.zeno.fm/n1dn94e661zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJuMWRuOTRlNjYxenV2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IndMNHY3cXRqUVctRnpJZmlsSU9BWVEiLCJpYXQiOjE3MjQ3OTU3MTYsImV4cCI6MTcyNDc5NTc3Nn0.yTy7HVDVwGFGlM1Ajrnr4zvEUg0qfSFiJSywx3Gl5Pk"},
    {name = "Super 100 Tegucigalpa 1001", url = "http://24233.live.streamtheworld.com/SUPER100_SC"},
    {name = "Radio Globo 885 HN", url = "https://stream.radiosmundiales.com:8016/GLOBO885"},
    {name = "Stereo Ceiba 999 - La Ceiba", url = "http://24253.live.streamtheworld.com:3690/RADIO_CEIBAAAC_SC"},
    {name = "Estereo Clásica", url = "https://streaming.radio.co/s0c06b7076/listen"},
    {name = "EXA FM: Música Pop En Español E Inglés", url = "https://14553.live.streamtheworld.com:443/XHPSFMAAC.aac"},
    {name = "Radio Moderna", url = "http://26583.live.streamtheworld.com:3690/MODERNAAAC_SC"},
    {name = "ROCK N' POP", url = "https://ice42.securenetsystems.net/ROCKNPOP"},
    {name = "Radio HRN La Voz De Honduras", url = "https://ice42.securenetsystems.net/HRN"},
    {name = "Vox FM Honduras - Tegucigalpa 1017 FM - San Pedro Sula 1061 FM", url = "https://ice42.securenetsystems.net/VOXFM"},
    {name = "Musiquera 933 FM", url = "https://stream-143.zeno.fm/83h238tqsceuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI4M2gyMzh0cXNjZXV2IiwiaG9zdCI6InN0cmVhbS0xNDMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjdxZHh5ZkRTUjBxZVFBeWJyNzRONFEiLCJpYXQiOjE3MjQ4NDc0MzUsImV4cCI6MTcyNDg0NzQ5NX0.ihFPlKKsymDxfnd4P43r3qm2w1R-oHzzCFzQ_C9_wr8"},
    {name = "Radioactiva 997 Honduras", url = "https://stream-142.zeno.fm/fh8qfg75puquv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJmaDhxZmc3NXB1cXV2IiwiaG9zdCI6InN0cmVhbS0xNDIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IlVDcEFtcEZqVFBlSU5aaG9lQk5DUEEiLCJpYXQiOjE3MjQ3NzU4NjgsImV4cCI6MTcyNDc3NTkyOH0.GJ0okvmkYdPYdP6tJO8Tnj-THIvzqE3Ed_gmF02bv3U"},
    {name = "Radio America 947 Tegucigalpa", url = "http://26583.live.streamtheworld.com:3690/AMERICA_SC"},
    {name = "EXA FM Honduras: Tegucigalpa 1005 FM San Pedro Sula 893 FM Choluteca 959 FM Litoral 939 FM", url = "https://stream-145.zeno.fm/0n4tnx3wd5zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIwbjR0bngzd2Q1enV2IiwiaG9zdCI6InN0cmVhbS0xNDUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ikh3RklrYmxWU2xxb0lSM2RuZWJEaXciLCJpYXQiOjE3MjQ4MTg2NDQsImV4cCI6MTcyNDgxODcwNH0.RY88GtJA33cL4Q2v5eDGG8X7ujrF2HVAgbnC-0YYerQ"},
    {name = "Dee Jay", url = "https://stream-146.zeno.fm/6wpxyt9htg0uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI2d3B4eXQ5aHRnMHV2IiwiaG9zdCI6InN0cmVhbS0xNDYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InA1TmtOcEg4U0JLVHVLdmV4R2FMSnciLCJpYXQiOjE3MjQ4NDkwNzYsImV4cCI6MTcyNDg0OTEzNn0.L-PP2apdMgwhPE4h9LW4yi4I8nu4d4d1hmWQiGIzl0g"},
    {name = "Radio Activa Honduras", url = "https://stream-143.zeno.fm/6n7fp9t2pceuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI2bjdmcDl0MnBjZXV2IiwiaG9zdCI6InN0cmVhbS0xNDMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InJyR2NKWmpIU2VTM3E2VzBOSXpVNWciLCJpYXQiOjE3MjQ4NDE1ODIsImV4cCI6MTcyNDg0MTY0Mn0.zp30jwIynHmuTGpwbwXypFrq6RUuoDqA1Fbo7U9_rgY"},
    {name = "Exa FM Honduras", url = "https://stream-145.zeno.fm/0n4tnx3wd5zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIwbjR0bngzd2Q1enV2IiwiaG9zdCI6InN0cmVhbS0xNDUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Im5YdFA3bzVnUWNxOEIzMXVfX3hlSWciLCJpYXQiOjE3MjQ4MzE2NTYsImV4cCI6MTcyNDgzMTcxNn0.WkXpPycWrazz8x3w3aqQon_KxrMPQ-tJOjNHm1doTD0"},
}

return stations
