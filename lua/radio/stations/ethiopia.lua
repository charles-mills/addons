local stations = {
    {name = "Hip Hop", url = "http://rtlberlin.streamabc.net/rtlb-rnb-mp3-192-6826628?sABC=66ps0948%230%232qqpnss01895rqr0s8oq129o03s183o0%23&aw_0_1st.playerid=&amsparams=playerid:;skey:1724844360"},
    {name = "Jazz", url = "http://mediaserv38.live-streams.nl:8006/live"},
    {name = "Ahadu Radio 943 Addis Abeba", url = "http://stream-155.zeno.fm/txxpndf1wwzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0eHhwbmRmMXd3enV2IiwiaG9zdCI6InN0cmVhbS0xNTUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkRkWXlyVHR5U1lpcmptTDVuWFhSQVEiLCJpYXQiOjE3MjQ4MDU5NDUsImV4cCI6MTcyNDgwNjAwNX0.Yv3ZF5WcS4dLCvNc1ERPZdVss6RligqRbV0RLwXbR3E"},
    {name = "Birhan Gospel Radio", url = "https://stream-175.zeno.fm/qt90skpqp0hvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJxdDkwc2twcXAwaHZ2IiwiaG9zdCI6InN0cmVhbS0xNzUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkV1Z2xDYnkxVEZlZjVhRl9VUTMzdlEiLCJpYXQiOjE3MjQ4NTA1NjcsImV4cCI6MTcyNDg1MDYyN30.0e-_LmwtlWnMtsUUQMyABdXSwSN3N-SQexWv4s6Ppak"},
    {name = "Tizta ትዝታ FM", url = "https://stream-175.zeno.fm/55nlq5yzqlftv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI1NW5scTV5enFsZnR2IiwiaG9zdCI6InN0cmVhbS0xNzUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InpsNENuNkFNUkIya0lHclRyS1YxYXciLCJpYXQiOjE3MjQ3OTUyNzYsImV4cCI6MTcyNDc5NTMzNn0.eLzqC2sRSzxOppjfehZm-lkN8E5g-tmJlae764T-a6U"},
    {name = "Afro FM", url = "http://stream-157.zeno.fm/fu367ky6hkeuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJmdTM2N2t5NmhrZXV2IiwiaG9zdCI6InN0cmVhbS0xNTcuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjMwRzRJaHZIU2kyUXJFV1dIZmUyVHciLCJpYXQiOjE3MjQ4NDk3NjAsImV4cCI6MTcyNDg0OTgyMH0.FseuE35ffcw2IUE_IJvXLgjNFAgc-8CtxxeEN3XD0-o"},
    {name = "Betemeskel ቤተመስቀል ☦️", url = "https://stream-153.zeno.fm/xbpzacbw298uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ4YnB6YWNidzI5OHV2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkxSckozQ0o5UXhPZmVPSXgyOU8zR1EiLCJpYXQiOjE3MjQ4NTAzOTEsImV4cCI6MTcyNDg1MDQ1MX0.EQDZ70mURIEFxbYNf3y8buEe2VwcA2e9xIuGGNLan9k"},
    {name = "Awash FM 907 Addis Abeba", url = "https://stream-164.zeno.fm/655zm6w4vc9uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI2NTV6bTZ3NHZjOXV2IiwiaG9zdCI6InN0cmVhbS0xNjQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IndvTHZWVTJTVDRXcmEteHV3MmhvZkEiLCJpYXQiOjE3MjQ4MDM3MjAsImV4cCI6MTcyNDgwMzc4MH0.WQqOrJT5emOriCZqzVqdjaAFnhwUK9A41SHbcMbbnyI"},
    {name = "Christian Mezmur Ethiopia", url = "https://stream-172.zeno.fm/0bws6ct0ey8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIwYndzNmN0MGV5OHV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ik1STEtaazB6UXktMm80cEdZYVkyVGciLCJpYXQiOjE3MjQ4MTAwNDAsImV4cCI6MTcyNDgxMDEwMH0.jFIhugyBmVRN_6C9xkpClOULJAVNp285g8QFvKy4r-Y"},
    {name = "Daily Hype Radio", url = "https://stream-154.zeno.fm/apzzddhstbruv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJhcHp6ZGRoc3RicnV2IiwiaG9zdCI6InN0cmVhbS0xNTQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImhXdUF3ZVhYVDNtaFVGaVBMZkdLc1EiLCJpYXQiOjE3MjQ3NzUzNjQsImV4cCI6MTcyNDc3NTQyNH0.YzzYo2A9FwNlMXm4bqHhDIIwh5DioQJr7-uuq7Agqrs"},
    {name = "Addis Music", url = "https://stream-156.zeno.fm/umguj2baxdctv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ1bWd1ajJiYXhkY3R2IiwiaG9zdCI6InN0cmVhbS0xNTYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InlUckZXZFlJU19pVmNKeURWdDBmU3ciLCJpYXQiOjE3MjQ3OTEzMzAsImV4cCI6MTcyNDc5MTM5MH0.XSDVJ9D02t9o266CNN78k3bhZ9DJs-m66ZiXkgzpUL8"},
    {name = "Amharic Live Sport የኳስ ኮሜኔታተር", url = "https://stream-155.zeno.fm/bqtruhn4q98uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJicXRydWhuNHE5OHV2IiwiaG9zdCI6InN0cmVhbS0xNTUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IldGanBtOGFBU0NLUDRFUl9xOFNLWXciLCJpYXQiOjE3MjQ4MjkyMjQsImV4cCI6MTcyNDgyOTI4NH0.Dc_47TF81fK01l1bYBjkuPnhO2Dhkz2ENXjR6a1sUkg"},
    {name = "اذاعة القرآن الكريم", url = "http://n11.radiojar.com/0tpy1h0kxtzuv?rj-ttl=5&rj-tok=AAABkZgq3SoA9_4IQyh_O157pA"},
    {name = "AXUMITE RADIO", url = "https://stream-176.zeno.fm/b9bn18xa2k8uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJiOWJuMTh4YTJrOHV2IiwiaG9zdCI6InN0cmVhbS0xNzYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImdWck94eF9LUzgyaTZmZXdkaW9EclEiLCJpYXQiOjE3MjQ3ODI0NjMsImV4cCI6MTcyNDc4MjUyM30.zFRzW6dn6g8KMjtPFzddIscU_kWemixQrYMLiFQgOQQ"},
    {name = "Afro FM 1053", url = "https://stream-157.zeno.fm/t5td4ky6hkeuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0NXRkNGt5NmhrZXV2IiwiaG9zdCI6InN0cmVhbS0xNTcuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InZ1ZnlSeGJjUzRhczB1U0hheV9VOEEiLCJpYXQiOjE3MjQ4NDk2MjMsImV4cCI6MTcyNDg0OTY4M30.yYNgxd_3uoAvkjFX4h_RvV_wZzW7k7la8V9byI-ZglI"},
    {name = "Voice Of Ethiopia", url = "https://stream-153.zeno.fm/hubm64kkr2zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJodWJtNjRra3IyenV2IiwiaG9zdCI6InN0cmVhbS0xNTMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImwwV2NueERXUkotZ0s0bElPd2xoanciLCJpYXQiOjE3MjQ3ODIwMzMsImV4cCI6MTcyNDc4MjA5M30.KmiQRNp1Zwp2Iad1uYiHNeRoV1qgQCGzF_sEG_dYMaQ"},
    {name = "EBC NATIONAL RADIO", url = "https://stream-159.zeno.fm/ad402tap7yzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJhZDQwMnRhcDd5enV2IiwiaG9zdCI6InN0cmVhbS0xNTkuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InMxMk5UQ0FmUjJxUjFaVXpoNm5EM3ciLCJpYXQiOjE3MjQ3ODgwMjIsImV4cCI6MTcyNDc4ODA4Mn0.SSMSP4E3kTQ59th9NYaGWmlXoyZDHOA8jOrxIeSFKao"},
    {name = "Voa", url = "https://n0d.radiojar.com/sgbs60fgq3quv?rj-ttl=5&rj-tok=AAABkZhhQSAA8AXLDH5t5kzLiA"},
    {name = "DW Amharic", url = "https://d121.rndfnk.com/ard/dw/dw08/mp3/64/stream.mp3?cid=01FMA3P53A77CS879ZHAN721HS&sid=2lGAXWXgllnZD6GXJyp4CF9QrE6&token=9JiZUf7VHhMFNAXMD213XMr6aFiL7svmI2xexyci6ng&tvf=2uQwMIrI7xdkMTIxLnJuZGZuay5jb20"},
    {name = "Yonjon", url = "http://stream-174.zeno.fm/tkkjml4sqsguv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0a2tqbWw0c3FzZ3V2IiwiaG9zdCI6InN0cmVhbS0xNzQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImFGNHg2NXJvVEhhWXFhRlVIUllGSnciLCJpYXQiOjE3MjQ4NTAxMTUsImV4cCI6MTcyNDg1MDE3NX0.W5zCYYsDJMGo6pzcyWIgrOJ86L3khsuHNAjUlIOs_C0"},
    {name = "Mirt Internet Radio", url = "http://stream-156.zeno.fm/akmuznguawzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJha211em5ndWF3enV2IiwiaG9zdCI6InN0cmVhbS0xNTYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjVCdkRCdmw3U01DMjV4dVFMQkQwRkEiLCJpYXQiOjE3MjQ4MjgwNzksImV4cCI6MTcyNDgyODEzOX0.Suw79QBxY0nOf1526QQGH1JkgrH1f0hgsLd3Yw_Hs_o"},
    {name = "Fm Addis 971", url = "http://stream-156.zeno.fm/7tzrhrap7yzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI3dHpyaHJhcDd5enV2IiwiaG9zdCI6InN0cmVhbS0xNTYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImdETWFrNXZmUmk2WUxvWEVZMi1FOFEiLCJpYXQiOjE3MjQ4MzA2ODYsImV4cCI6MTcyNDgzMDc0Nn0.lRBqDwpWrLhZx0Mv2Syvyq4FrgyYDx_n3QZDzDnUuWI"},
    {name = "TIRITA 976 FM", url = "https://stream-159.zeno.fm/x751reg18zhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ4NzUxcmVnMTh6aHZ2IiwiaG9zdCI6InN0cmVhbS0xNTkuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkF1aDJ5Y2VRU2NtNi1mWjVuSmR3bVEiLCJpYXQiOjE3MjQ4Mzg3MDUsImV4cCI6MTcyNDgzODc2NX0.aRF1SI_ewevwCXR1AyziQaXl-UPcrVoecslBNmufTHQ"},
    {name = "Ethio FM 1078", url = "https://stream-160.zeno.fm/72y045deqeruv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI3MnkwNDVkZXFlcnV2IiwiaG9zdCI6InN0cmVhbS0xNjAuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImdHVlNLTTVTU3Z5RjlNNkRiN3ZfQVEiLCJpYXQiOjE3MjQ4NDU0OTAsImV4cCI6MTcyNDg0NTU1MH0.Cr9kea3PI-gWPNctckOSHNeDLnoN-NvBDIj2j6Ingvk"},
    {name = "Finfinnee Raadiyoo", url = "https://stream-174.zeno.fm/gtb0xm6vbm5tv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJndGIweG02dmJtNXR2IiwiaG9zdCI6InN0cmVhbS0xNzQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImRIbEFGRmdSUkh5ZGRibHB6RF9EdXciLCJpYXQiOjE3MjQ4NTA3OTgsImV4cCI6MTcyNDg1MDg1OH0.gDLJhSZDCV7itTYDX-yR8lwKcBGNjeLZzf2quXnOcVo"},
    {name = "Ethiopian Orthodox Church Mezmur", url = "https://stream-163.zeno.fm/pfaho9uockwuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJwZmFobzl1b2Nrd3V2IiwiaG9zdCI6InN0cmVhbS0xNjMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ik5rTGZ6OTdoUlotOG1MY1NEbDk3LUEiLCJpYXQiOjE3MjQ4NDM2NjksImV4cCI6MTcyNDg0MzcyOX0.oaM1lRnwf904abHHH-KrMIAW7Xy7d3K5eXdgOzB4nEQ"},
    {name = "Addis Walta FM 1053", url = "https://stream-156.zeno.fm/t5td4ky6hkeuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0NXRkNGt5NmhrZXV2IiwiaG9zdCI6InN0cmVhbS0xNTYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ik5kbHBEeE9PUjMtRFBpcFd6VFFGX1EiLCJpYXQiOjE3MjQ4NDIyNTQsImV4cCI6MTcyNDg0MjMxNH0.-PBKyebfQallkl5bksuUwuVIRSB9qXVQdDgKsPvMXd8"},
    {name = "Oromia Broadcasting Network", url = "https://stream-159.zeno.fm/9kha8gxkpd0uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI5a2hhOGd4a3BkMHV2IiwiaG9zdCI6InN0cmVhbS0xNTkuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IlYtVktjU1ByUnk2amp0SUYwTVMybXciLCJpYXQiOjE3MjQ4MTg3NjQsImV4cCI6MTcyNDgxODgyNH0.NSJbpUBQ73WaJmZyza4O3k9UwekqxSCOyLGpIkkefK8"},
    {name = "Jano FM", url = "https://stream-161.zeno.fm/1cyn1as4v68uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIxY3luMWFzNHY2OHV2IiwiaG9zdCI6InN0cmVhbS0xNjEuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Im80ZTVsVENkUlJ1elE5ZWNkWGVUbFEiLCJpYXQiOjE3MjQ4MTkxNTcsImV4cCI6MTcyNDgxOTIxN30.DfbileZEAigb7xluxCzRULVPsKsCfdn43OI2TXnt8Sk"},
    {name = "Rahel Radio", url = "https://stream-162.zeno.fm/vt1u6fr1h2zuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ2dDF1NmZyMWgyenV2IiwiaG9zdCI6InN0cmVhbS0xNjIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImpQdGtuNV9OU29xdEt4T2FtYzBzcGciLCJpYXQiOjE3MjQ4MjU5MjMsImV4cCI6MTcyNDgyNTk4M30.VyWRV43-TXrbgQmO_EW23OH2IaoLQ8PXQGNacJbfyNI"},
    {name = "EBC Radio 1047 Addis Abeba", url = "https://stream-157.zeno.fm/2xguamap7yzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiIyeGd1YW1hcDd5enV2IiwiaG9zdCI6InN0cmVhbS0xNTcuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ik9RS1k0SkRnVFhPdW5fUURCVU9zSFEiLCJpYXQiOjE3MjQ4MjU2NzEsImV4cCI6MTcyNDgyNTczMX0.sXjYx79spHAcZ4WHLj8NsVzjCdP6ZKf5sl-KFtpgwXU"},
    {name = "Taem Radio ጣዕም ሬድዮ", url = "https://stream-158.zeno.fm/ffg8htkh1k0uv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJmZmc4aHRraDFrMHV2IiwiaG9zdCI6InN0cmVhbS0xNTguemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkNndlcyYy01VHZ1NlFRNEdXS1pHdVEiLCJpYXQiOjE3MjQ3NzU5OTgsImV4cCI6MTcyNDc3NjA1OH0.03IUl6QHXAjCYgPFEdNcLwh1Fd6_WG4kH15AnN2zRqI"},
    {name = "Halaal Media", url = "https://stream-172.zeno.fm/rqx24qj7offvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJycXgyNHFqN29mZnZ2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ikl3ZjBnV0xEVHIybXJ4a2VuYjN2Z1EiLCJpYXQiOjE3MjQ4MTc2NjMsImV4cCI6MTcyNDgxNzcyM30.HtLKX7CmUbSnaCMLOTnqwPNhZ8URLJbMfHA7awZJNlM"},
    {name = "Sheger FM", url = "https://stream-147.zeno.fm/y91n1vtbaw5tv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ5OTFuMXZ0YmF3NXR2IiwiaG9zdCI6InN0cmVhbS0xNDcuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IkUzczZ1WmNVUmN1MDhqSzBYcHJwYlEiLCJpYXQiOjE3MjQ3Nzg1MzgsImV4cCI6MTcyNDc3ODU5OH0.v5BWzamwO2ADHccaP3-1NFUebLoWgJKfjDleJq92aQ4"},
    {name = "FM ADDIS 97-1", url = "https://stream-156.zeno.fm/rb6wbrap7yzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJyYjZ3YnJhcDd5enV2IiwiaG9zdCI6InN0cmVhbS0xNTYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InR6UXlBVjRHUWtXTkJFdkdWTUV2N2ciLCJpYXQiOjE3MjQ4MzA5MDEsImV4cCI6MTcyNDgzMDk2MX0.VHJs4MD4YRDvOsWEd8ig0fewna3MT79xPibdYHjJ7QI"},
    {name = "Yenevibe Radio", url = "https://stream-156.zeno.fm/5mz3qqftsnhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiI1bXozcXFmdHNuaHZ2IiwiaG9zdCI6InN0cmVhbS0xNTYuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImZ3aUY0ZG9HVEpLSjhISHVqelNFVVEiLCJpYXQiOjE3MjQ3OTY5NjMsImV4cCI6MTcyNDc5NzAyM30.p4Sey5y0D9Opg903HxA-7sOdanVnGwME_XDs17wQqC8"},
    {name = "Yengat Weg", url = "https://stream-172.zeno.fm/pp0d9hyddxquv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJwcDBkOWh5ZGR4cXV2IiwiaG9zdCI6InN0cmVhbS0xNzIuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjNHa2p5QnU5UVcybTdVM0lIZDRDMEEiLCJpYXQiOjE3MjQ3NzUwMDEsImV4cCI6MTcyNDc3NTA2MX0.dekcT1r5yLOP4OMoQ0Vadf3wqscfYWVUu6uZuiEB1tE"},
    {name = "Sheger365", url = "https://stream-174.zeno.fm/hnx6hqn05bhvv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJobng2aHFuMDViaHZ2IiwiaG9zdCI6InN0cmVhbS0xNzQuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6ImR3LVRzOHN6U04tWm1lUk85Ml9mUlEiLCJpYXQiOjE3MjQ4NDU0ODgsImV4cCI6MTcyNDg0NTU0OH0.ABf0tnbxsODQktrzI0jQbqMHEdCf_beu7udQAa-QzOU"},
    {name = "Sheger FM 1021", url = "https://stream-140.zeno.fm/y91n1vtbaw5tv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ5OTFuMXZ0YmF3NXR2IiwiaG9zdCI6InN0cmVhbS0xNDAuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6Ii1LNEZuNmh2VFAtbEpvUURZcEtWdHciLCJpYXQiOjE3MjQ4MTg4MzUsImV4cCI6MTcyNDgxODg5NX0.3tKJ1aolYnlFJoMUcoX4lxMbb_Ft_i35FLgY5ps9WkE"},
}

return stations
