## PreView
<pre>

    ██╗  ██╗ ██████╗ ██╗  ██╗ ██████╗ ██╗  ██╗     ███████╗███████╗ ██████╗
    ██║ ██╔╝██╔═══██╗██║ ██╔╝██╔═══██╗██║ ██╔╝     ██╔════╝██╔════╝██╔════╝
    █████╔╝ ██║   ██║█████╔╝ ██║   ██║█████╔╝█████╗███████╗█████╗  ██║     
    ██╔═██╗ ██║   ██║██╔═██╗ ██║   ██║██╔═██╗╚════╝╚════██║██╔══╝  ██║     
    ██║  ██╗╚██████╔╝██║  ██╗╚██████╔╝██║  ██╗     ███████║███████╗╚██████╗
    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝     ╚══════╝╚══════╝ ╚═════╝                                                                                           
     ====================================================================
     **                  Instagram : @risky.manuel                     **
     **                  Telegram  : @kikikokok9                       **
     **                  Email     : riskymanuel08@proton.me           **
     ====================================================================
<pre>

## Sample Demo
<a href="https://ibb.co.com/NSRrnQ8"><img src="https://i.ibb.co.com/cLqwXMG/mp3.png" alt="mp3" border="0"></a>


## Boleh Di Coba
bisa di jalankan di localhost tanpa ada halangan pop up malware yang secara otomatis terbuka pada website pada umumnya seperti "intext:ytmp3" dan website lainya yang menyediakan converter secara gratis.
setelah di unduh file "kikiw.rb" buka localhost seperti biasannya, copy paste link yang ada di yt, Hasil nya ("File berhasil diunduh! Cek folder: ./downloads")

## Sample Logs
┌──[root@parrot][/home/rrsec/Dokumen/coding]root
└──╼ # ruby kikiw.rb                                     
/var/lib/gems/3.1.0/gems/sinatra-4.0.0/lib/sinatra/base.rb:1849: warning: Rack::Logger is deprecated and will be removed in Rack 3.2.
[2024-11-17 20:29:39] INFO  WEBrick 1.8.1
[2024-11-17 20:29:39] INFO  ruby 3.1.2 (2022-04-12) [x86_64-linux-gnu]
== Sinatra (v4.0.0) has taken the stage on 4567 for development with backup from WEBrick
[2024-11-17 20:29:39] INFO  WEBrick::HTTPServer#start: pid=87579 port=4567
127.0.0.1 - - [17/Nov/2024:20:30:39 +0700] "GET / HTTP/1.1" 200 1742 0.0051
127.0.0.1 - - [17/Nov/2024:20:30:39 WIB] "GET / HTTP/1.1" 200 1742
- -> /
Menjalankan perintah: yt-dlp -x --audio-format mp3 -o './downloads/%(title)s.mp3' https://www.youtube.com/watch?v=qtCnA_TbqVA
[youtube] Extracting URL: https://www.youtube.com/watch?v=qtCnA_TbqVA
[youtube] qtCnA_TbqVA: Downloading webpage
[youtube] qtCnA_TbqVA: Downloading ios player API JSON
[youtube] qtCnA_TbqVA: Downloading mweb player API JSON
[youtube] qtCnA_TbqVA: Downloading m3u8 information
[info] qtCnA_TbqVA: Downloading 1 format(s): 251
[download] Destination: ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.webm
[download] 100% of    1.79MiB in 00:00:00 at 3.04MiB/s
[ExtractAudio] Destination: ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.mp3
Deleting original file ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.webm (pass -k to keep)
127.0.0.1 - - [17/Nov/2024:20:33:11 +0700] "POST /download HTTP/1.1" 200 81 6.2857
127.0.0.1 - - [17/Nov/2024:20:33:05 WIB] "POST /download HTTP/1.1" 200 81
http://localhost:4567/ -> /download
127.0.0.1 - - [17/Nov/2024:20:35:15 +0700] "GET / HTTP/1.1" 200 1742 0.0009
127.0.0.1 - - [17/Nov/2024:20:35:15 WIB] "GET / HTTP/1.1" 200 1742
- -> /
Menjalankan perintah: yt-dlp -f 'bestvideo+bestaudio' --merge-output-format mp4 -o './downloads/%(title)s.mp4' https://www.youtube.com/watch?v=qtCnA_TbqVA
[youtube] Extracting URL: https://www.youtube.com/watch?v=qtCnA_TbqVA
[youtube] qtCnA_TbqVA: Downloading webpage
[youtube] qtCnA_TbqVA: Downloading ios player API JSON
[youtube] qtCnA_TbqVA: Downloading mweb player API JSON
[youtube] qtCnA_TbqVA: Downloading m3u8 information
[info] qtCnA_TbqVA: Downloading 1 format(s): 616+251
[hlsnative] Downloading m3u8 manifest
[hlsnative] Total fragments: 22
[download] Destination: ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.f616.mp4
[download] 100% of   20.22MiB in 00:00:08 at 2.36MiB/s
[download] Destination: ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.f251.webm
[download] 100% of    1.79MiB in 00:00:00 at 6.46MiB/s
[Merger] Merging formats into "./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.mp4"
Deleting original file ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.f616.mp4 (pass -k to keep)
Deleting original file ./downloads/Lagu Doraemon dalam 3 Bahasa ｜ Jepang Indonesia Jawa.f251.webm (pass -k to keep)
127.0.0.1 - - [17/Nov/2024:20:35:38 +0700] "POST /download HTTP/1.1" 200 81 13.0148
127.0.0.1 - - [17/Nov/2024:20:35:25 WIB] "POST /download HTTP/1.1" 200 81
http://localhost:4567/ -> /download


## Notice
Hanya Video-video dari youtube saja yang bisa di convert mp3 atau mp4, Selamat Menikmati! tanpa ads dan pop up malware di website pada umunya
