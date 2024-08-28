local stations = {
    {name = "9Jastar", url = "http://eu4.fastcast4u.com:5026/stream"},
    {name = "Dream Center Internet Radio", url = "https://admin.dciradio.org/radio/8010/radio.mp3"},
    {name = "Lagosjump Radio", url = "https://radio.lagosjumpradio.com/listen/lagosjump_radio/radio.mp3"},
    {name = "FAD FM", url = "https://radio.gotright.net/listen/fadfm/radio.mp3"},
    {name = "Gospotainment Radio", url = "https://radio.gotright.net/radio/8000/radio.mp3"},
    {name = "Kcity Radio", url = "https://radio.gotright.net/radio/8010/radio.mp3"},
    {name = "Enugu Love FM", url = "https://stream13.shoutcastsolutions.com/proxy/enugulovefm?mp=/stream.mp3"},
    {name = "Rose FM", url = "http://ec1.everestcast.host:4730/stream"},
    {name = "ROYAL FM 955", url = "https://radio.sternhost.com:8010/radio.mp3"},
    {name = "Rapid FM 965 Umuahia", url = "https://stream13.shoutcastsolutions.com/proxy/rapidfm965?mp=/stream"},
    {name = "Sobi FM", url = "https://edge.mixlr.com/channel/aqspm"},
    {name = "Splash FM 1055", url = "https://edge.mixlr.com/channel/cfeki"},
    {name = "Buzz FM Aba – 897 FM", url = "https://edge.mixlr.com/channel/qytfx"},
    {name = "Grace 955 FM", url = "http://s3.voscast.com:10436/stream"},
    {name = "955 – Boss FM", url = "https://edge.mixlr.com/channel/oeltj"},
    {name = "Panache Fm", url = "https://s3.radio.co/s9838fd88d/listen"},
    {name = "Majorfm", url = "http://stream-172.zeno.fm/pkza99xshkhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJwa3phOTl4c2hraHZ2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjJta2FQRUI2U0k2UmJiZlFMUGh1YkEiLCJpYXQiOjE3MjQ4NDk1ODAsImV4cCI6MTcyNDg0OTY0MH0.I16qaaf6Z5fh5Ax_L-47wxjlbb__7VtmY7kUd4zjA9U"},
    {name = "Godfrey Okoye University Radio 1069Fm", url = "https://us5new.listen2myradio.com:2199/stream.php?port=8178"},
    {name = "991 – Odenigbo FM, Obosi", url = "https://stream-172.zeno.fm/rx197cbviawvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJyeDE5N2Nidmlhd3Z2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkluU3FjSXFtUTRlUzJodE1RR3N1dXciLCJpYXQiOjE3MjQ4MTY0MjEsImV4cCI6MTcyNDgxNjQ4MX0.yf_QNI5Hd0w_w7bS0HRN069__TGRLYbmH8ck5KGBYGY"},
    {name = "Inspiration 923FM Lagos Nigeria", url = "https://video.servoserver.com.ng/ifmuyo/livestream.m3u8?hls_ctx=dh042du1"},
    {name = "RFI Haoussa", url = "http://rfihaoussa96k.ice.infomaniak.ch/rfihaoussa-96k.mp3"},
    {name = "BCA Abia", url = "https://broadcas.radioca.st/stream.mp3"},
    {name = "Gangan Radio", url = "https://stream-176.zeno.fm/9reuhyz8up8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI5cmV1aHl6OHVwOHV2IiwiaG9zdCI6InN0cmVhbS0xNzYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImFhZkVkYmZ3UWJhYmVtTV9JVDQ2ZUEiLCJpYXQiOjE3MjQ4NDMwMTMsImV4cCI6MTcyNDg0MzA3M30.wrrLyR9xnTiJfyHDcdO6J43jTTYG5Y1dQZJ3qr6Na3k"},
    {name = "METRO FM LAGOS", url = "https://go.webgateready.com/metrofm/radio.mp3"},
    {name = "Obong Radio", url = "https://stream-175.zeno.fm/vlssnjcwkisvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ2bHNzbmpjd2tpc3Z2IiwiaG9zdCI6InN0cmVhbS0xNzUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImYxNXM5aC02VDhtOXJBZU1qQVdNbEEiLCJpYXQiOjE3MjQ4NDQxOTQsImV4cCI6MTcyNDg0NDI1NH0.isWUJZcNBNCqJg1akcfzeECra8kSgoKcKA2dtnWPrsA"},
    {name = "Praiseworld Radio", url = "https://streaming.radio.co/s7dc18f0ad/listen"},
    {name = "Inform Me Radio", url = "http://stream-154.zeno.fm/ta1fke6sz1zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0YTFma2U2c3oxenV2IiwiaG9zdCI6InN0cmVhbS0xNTQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkNwdkpYUDBiUUsydDZjMlpZUE00eVEiLCJpYXQiOjE3MjQ4NDI4NzMsImV4cCI6MTcyNDg0MjkzM30.halAkFEwU1TASC4Mz0yaFPMhVPtbT8D1ByryA0Ls2Tg"},
    {name = "Splash FM Abeokuta", url = "https://stream-172.zeno.fm/m9x6zr5trp8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJtOXg2enI1dHJwOHV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjV1YnN3N3l5UVdPQ3U3X3g1X2xxeHciLCJpYXQiOjE3MjQ4MTEyNDgsImV4cCI6MTcyNDgxMTMwOH0.nM42e9N2ra_JnZ3GPBRDcOHDuMWX7RlnzSb6b7NI0A8"},
    {name = "Sunshine FM 1045 Mhz Potiskum", url = "https://stream-154.zeno.fm/cu2e39ra0chvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJjdTJlMzlyYTBjaHZ2IiwiaG9zdCI6InN0cmVhbS0xNTQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkFXd0hEcHFNUUxLejVqM1ppOS1lV2ciLCJpYXQiOjE3MjQ4MTIwNTgsImV4cCI6MTcyNDgxMjExOH0.mYOdBwicsffIjsssxZxHoUaHs9Yl2r2rtMtkiimxrNc"},
    {name = "Radio One FM 1035 Lagos", url = "https://www.go.webgateready.com/radioonefm"},
    {name = "Nishadi Radio Online", url = "https://stream-171.zeno.fm/cm3s6305kg8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJjbTNzNjMwNWtnOHV2IiwiaG9zdCI6InN0cmVhbS0xNzEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IldkUHJnckU1UkJPRklfM0ZpTXJJZnciLCJpYXQiOjE3MjQ3OTQ3NDYsImV4cCI6MTcyNDc5NDgwNn0.0T0GjjzBKc3POM2rIUA7I5l-9Ik8QPE9mM47Y_zlKLw"},
    {name = "Radiotiwa", url = "https://stream-172.zeno.fm/tvqvamkwe5zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0dnF2YW1rd2U1enV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InFzdzEtcGFTU1pXcEN3bURzaG5CaXciLCJpYXQiOjE3MjQ4MzQyMjMsImV4cCI6MTcyNDgzNDI4M30.Z0mGolX3K1nL_S8V6ynlUJu_4s9pc7ac9MMHdWqYLNo"},
    {name = "Usaku FM 905", url = "https://eu8.fastcast4u.com/proxy/usakufm?mp=/1"},
    {name = "Fahimta Radio", url = "https://stream-171.zeno.fm/x6vurqw6508uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ4NnZ1cnF3NjUwOHV2IiwiaG9zdCI6InN0cmVhbS0xNzEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ilc3bzFoM1d4U3c2SzlnejUzVlhEbnciLCJpYXQiOjE3MjQ4MzkxOTAsImV4cCI6MTcyNDgzOTI1MH0.SIMW99dNVOq1cgLO6xhwSi31K0ctE8coFDFVzda3W3E"},
    {name = "The Today Africa Radio", url = "http://stream-176.zeno.fm/e66eb3qmg48uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJlNjZlYjNxbWc0OHV2IiwiaG9zdCI6InN0cmVhbS0xNzYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImFDOHNLeWJWUXZheXQ2Y1YtOHc0c1EiLCJpYXQiOjE3MjQ4MDMwODIsImV4cCI6MTcyNDgwMzE0Mn0.cZybGYCO_uI7K7Nps4cGs52pxVHDYRZEMHWK0N6Q36M"},
    {name = "Nagari Radio", url = "http://stream-172.zeno.fm/287z97ksdg8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIyODd6OTdrc2RnOHV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkMycTgwT256UmllWkdpTHlnYXhqMGciLCJpYXQiOjE3MjQ4MzE3MzUsImV4cCI6MTcyNDgzMTc5NX0.bH2l9zXT8ygJGK4RjsuTWdRpP-GHbMUYa7sWgcgLSDI"},
    {name = "NCBN Abuja", url = "https://stream-160.zeno.fm/1zur4ycs6x8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIxenVyNHljczZ4OHV2IiwiaG9zdCI6InN0cmVhbS0xNjAuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InZfYVdnMlRxUUNHU0RJSHh2c0N3N1EiLCJpYXQiOjE3MjQ4MzA2ODIsImV4cCI6MTcyNDgzMDc0Mn0.qhu2f8BVNeSQ30BSYxCMmE2otetTgS5LOgMZEjyehf8"},
    {name = "HOD RADIO", url = "https://servidor21.brlogic.com:7766/live"},
    {name = "Green Radio Uganda", url = "https://servidor17-1.brlogic.com:7940/live?source=12124"},
    {name = "Adamimogo FM", url = "http://stream-161.zeno.fm/sywy4vua6zhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJzeXd5NHZ1YTZ6aHZ2IiwiaG9zdCI6InN0cmVhbS0xNjEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InM2dWR6bTh2Ulp5YVFPVnMzdTFFQUEiLCJpYXQiOjE3MjQ4NDYxOTgsImV4cCI6MTcyNDg0NjI1OH0.znUv-xtgrGZ7PLLbGdXRUCi0kXDTL6BnB8xIveR5dnA"},
    {name = "Radio East", url = "http://stream-153.zeno.fm/7f4w4us5wp8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI3ZjR3NHVzNXdwOHV2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InJnQUtudU9MVEZDT085S0NrZVlLUnciLCJpYXQiOjE3MjQ4MzQyNTIsImV4cCI6MTcyNDgzNDMxMn0.gRgyj78ph1ReRVE2MHdv-sT3ZGbvgMlLnZ8i4k1t3PE"},
    {name = "Nigerian Gospel Music Radio MP3", url = "http://stream-163.zeno.fm/3fmqr74a7f8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIzZm1xcjc0YTdmOHV2IiwiaG9zdCI6InN0cmVhbS0xNjMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Imd5UUFob3NlUUh1WC0xeDA2ajJXa2ciLCJpYXQiOjE3MjQ4MjEwNzAsImV4cCI6MTcyNDgyMTEzMH0.GJ979GMe8XSv1pOjumc9CyxRALAbbcQw6loz7_G5rak"},
    {name = "Odenigbo FM", url = "https://stream-172.zeno.fm/rx197cbviawvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJyeDE5N2Nidmlhd3Z2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IlFvT3hKUEx0UTdPSzd2U0FzRk5zdHciLCJpYXQiOjE3MjQ3ODQxMDYsImV4cCI6MTcyNDc4NDE2Nn0.ffsvuRDRg2c9dZnWcbAyTzp5kXYO-IldpMnm3_KC-oQ"},
    {name = "Awoko Radio", url = "http://stream-176.zeno.fm/tqq99en94v8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0cXE5OWVuOTR2OHV2IiwiaG9zdCI6InN0cmVhbS0xNzYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkxPWlV4cjZpUnNlV3Q3dTZ0MlM2cGciLCJpYXQiOjE3MjQ4Mjc4MTgsImV4cCI6MTcyNDgyNzg3OH0.eBuQXcQQCTVoqgAaO_YqsAf0qWGIZPTF59ZBWCeFUbc"},
    {name = "YES 1017 FM", url = "https://stream-173.zeno.fm/kqgbf9g3mfhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJrcWdiZjlnM21maHZ2IiwiaG9zdCI6InN0cmVhbS0xNzMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjFtYUhLZG5sU0NTZm9Vb0tLMmNzNEEiLCJpYXQiOjE3MjQ3NzY0OTEsImV4cCI6MTcyNDc3NjU1MX0.jA2txmd9CSTpHbergRRcmJqkPHqdgij6sQyRRh8ZdKc"},
    {name = "Yes FM 1017", url = "https://stream-173.zeno.fm/kqgbf9g3mfhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJrcWdiZjlnM21maHZ2IiwiaG9zdCI6InN0cmVhbS0xNzMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Im1pVWlUbG5ZVHItNEd2cjE1RzZJOUEiLCJpYXQiOjE3MjQ3ODg1MTUsImV4cCI6MTcyNDc4ODU3NX0.SjZup-FMgFt0y18HE5vZOhnbLwkD47h_XUxiJps8XFs"},
    {name = "#Radio Quran", url = "http://n09.radiojar.com/0tpy1h0kxtzuv?rj-ttl=5&rj-tok=AAABkZkWGq8AlNk74Ey3wKJDfQ"},
    {name = "Wigradio", url = "https://stream-152.zeno.fm/k4w8hv26nzzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJrNHc4aHYyNm56enV2IiwiaG9zdCI6InN0cmVhbS0xNTIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IlVTWG93ZVJIUnZHaWV6MUppZG42bHciLCJpYXQiOjE3MjQ4NDEyNTQsImV4cCI6MTcyNDg0MTMxNH0.M1n7YLLD-tVRxo6DGlBaF0ctaL56lYtaZfvNOux4BWs"},
    {name = "URBAN RADIO ENUGU", url = "https://edge.mixlr.com/channel/cfldr"},
    {name = "Unilag Radio", url = "https://stream-153.zeno.fm/w68a71f8568uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ3NjhhNzFmODU2OHV2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ik8zMkl6QXNtUzFpZzdoSkFKZGxMSHciLCJpYXQiOjE3MjQ4MzI3MzMsImV4cCI6MTcyNDgzMjc5M30.6gi5Kd1x6z8YTOCzGv5BuWu-4UzkSlY-LiZDauDmb2g"},
}

return stations
