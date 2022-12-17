[![Pre-Release](https://github.com/IkhlasulHanif/proyek-tugas-akhir/actions/workflows/pre-release.yml/badge.svg)](https://github.com/KingGedorah/share-eat/actions/workflows/pre-release.yaml)
[![Release](https://github.com/IkhlasulHanif/proyek-tugas-akhir/actions/workflows/release.yml/badge.svg)](https://github.com/IkhlasulHanif/proyek-tugas-akhir/actions/workflows/release.yml) 

[Link APK](https://drive.google.com/drive/u/3/folders/1j8hB_6BCEZ9d9NPGbEc2KY8UA6zQFPyW)

### Tugas Kelompok Akhir Semester Pemrograman Berbasis Platform Kelompok D03
---
# Speak Up Now

## Nama anggota kelompok

1. Fahira Adindiah (2106751575)
2. Alifia Nadiya Putri (2106708002)
3. Muhammad Satria Ramadhan (2106751695)
4. Ikhlasul Akmal Hanif (2106650462)
5. Fahmi Sabila Firdaus (2106751745)

## Deskripsi aplikasi 

Platform (website dan mobile app) yang akan kami kembangkan adalah Speak Up Now. Speak Up Now merupakan portal informasi dan pelaporan pelecehan seksual, dengan mengintegrasikan mobile app dengan website [Speak Up Now Website](https://speak-up-now.herokuapp.com/). Speak Up Now hadir sebagai salah satu bentuk dukungan kami kepada kegiatan G20. Speak Up Now berfokus pada isu employment, gender, education and social policies yang dibahas pada G20. Speak Up Now bertujuan untuk menjadi salah satu penyedia jalan keluar dari masalah yang dihadapi para penyintas pelecehan seksual. Alasan kami memilih Speak Up Now sebagai platform yang kami kembangkan adalah karena kami merasa isu mengenai kejahatan gender, termasuk tindak pelecehan seksual, masih hangat dan perlu untuk digaungkan lebih keras lagi.

Melalui Speak Up Now, kami ingin membuat wadah pelaporan yang kredibel dan dapat diandalkan untuk para penyintas pelecehan seksual, khususnya di lingkungan Universitas Indonesia. Para pengguna akan diminta membuat akun di platform tersebut. Setelah memiliki akun, mereka akan dibagi menjadi 2 tipe, yaitu admin atau pengguna biasa. Akses yang dimiliki admin antara lain melihat dan menanggapi daftar laporan yang diberikan pengguna, melihat dan memberi konsultasi dari pengguna, dan membuat akun admin yang baru.

Sementara itu, akses yang dimiliki pengguna biasa antara lain fitur untuk melaporkan kasus pelecehan seksual dan juga fitur untuk melakukan konsultasi.

Kami berharap Speak Up Now dapat menjadi bentuk nyata kami atas penolakan terhadap tindakan pelecehan seksual dalam bentuk apapun di dalam lingkungan kampus Universitas Indonesia.

Pengguna aplikasi ini dibagi menjadi dua yaitu:

1. User
   -  Memberikan laporan terhadap kekerasan seksual
   -  Melakukan konsultasi
2. Admin
   -  Melihat dan menanggapi daftar laporan yang diberikan pengguna
   -  Memproses laporan dan memberikan konsultasi
   -  Membuat akun admin baru


## Daftar modul yang akan diimplementasikan

Beberapa modul yang akan kami implementasikan antara lain:
1. Home page
   -  Fitur login dan sign up
      Pada fitur ini pengguna dapat mendaftarkan akunnya pada aplikasi. Selain itu pengaturan autentikasi juga diatur dalam fitur ini.
   -  Landing page

2. User page
   -  Fitur konsultasi <br>
      Pada fitur ini pengguna dapat menulis konsultasi terkait kejadian pelecehan seksual yang pernah dialaminya. Hal yang perlu diimplementasikan:
      - Get data konsultasi dari Web
      - Page form konsultasi
      - Post data dari form ke Web
      - Page untuk menampilkan data yang difilter terhadap user.
      - Delete konsultasi
      - Page untuk melihat detail konsultasi
      
   -  Fitur laporan <br>
      Pada fitur ini pengguna dapat melaporkan kejadian pelecehan seksual yang dialami orang lain atau pengguna itu sendiri.
      - Get data laporan dari Web
      - Page form laporan
      - Post data dari form ke Web
      - Page untuk menampilkan data yang difilter terhadap user.
      - Delete laporan
      - Page untuk melihat detail laporan

3. Admin page
   - Fitur jawab konsultasi <br>
     Pada fitur ini admin dapat menjawab konsultasi dari pengguna. Hal yang perlu diimplementasikan:
     - Get data konsultasi dari web
     - Page untuk menampilkan data konsultasi dari seluruh user
     - Delete konsultasi
     - Page untuk melihat detail konsultasi
     - Page form reply konsultasi
     - Post data reply dari form ke web
     
   - Fitur jawab laporan <br>
     Pada fitur ini admin dapat mengverfikasi atau memberi respon terhadap laporan yang diberikan pengguna. Hal yang perlu diimplementasikan:
     - Get data laporan dari web
     - Page untuk menampilkan data laporan dari seluruh user
     - Delete laporan
     - Page untuk melihat detail laporan
     - Page form reply laporan
     - Post data reply dari form ke web
     
Pembagian tugas:
1. Home page (fitur login dan sign up) oleh Muhammad Satria Ramadhan
2. User page (fitur konsultasi) oleh Fahira Adindiah
3. User page (fitur laporan) oleh Ikhlasul Akmal Hanif 
4. Admin page (fitur jawab konsultasi) oleh Fahmi Sabila Firdaus
5. Admin page (fitur jawab laporan) oleh Alifia Nadiya Putri

## Alur pengintegrasian web service
1. Melengkapi endpoint yang akan digunakan pada disetiap modul.
2. Menambahkan middleware pada aplikasi django agar API dapat diakses dari luar website.
3. Memmbuat model pada flutter yang akan digunakan untuk menampung data dikirim dari django.
4. Membuat fungsi asynchronus terutama dalam meload page untuk semua proses baik post maupun get.
5. Memanfaatkan http.get yang mengarah pada enpoint data pada web untuk proses pengambilan data.
6. Memanfaatkan http.post yang mengarah pada endpoint penyimpanan/pembuatan data agar data dapat disimpan pada database django.

Event Handling:
1. Home page
   -  Fitur Autentikasi <br>
      - Dalam fitur ini, pengguna aplikasi perlu melakukan proses autentikasi/login akun untuk menuju ke halaman homepage atau halaman utama. Dalam pemakaiannya, pengguna aplikasi akan diminta untuk mengisi username dan password di kolom yang sudah disediakan dalam aplikasi dan menekan tombol 'Login' sehingga form yang telah terisi dapat di verifikasi oleh sistem. Proses verifikasi ini menggunakan pengiriman data dari aplikasi menuju database Railway melalui backend Django dengan metode POST. Apabila form sesuai dengan database atau valid, pengguna aplikasi kemudian akan diarahkan meunuju halaman utama. Namun, apabila form tidak sesuai atau tidak valid, pengguna aplikasi akan diminta untuk mengisi kembali form sampai sistem memberikan otorisasi.
   -  Fitur Homepage <br>
      - Pada fitur ini, pengguna aplikasi diberikan penjelasan singkat mengenai visi/misi dan tujuan dari SpeakUpNow. Selain itu, disediakan juga navigation bar untuk akses ke halaman-halaman berikutnya. Adapun penambahan floating button sehingga pengguna aplikasi dapat logout/keluar dari aplikasi.<br>
2. User page
   -  Fitur laporan <br>
      - pada fitur report summary, saat item ditekan dengan memanfaatkan event handler onTap(), maka halaman akan diredirect dengan memanfaatkan Navigator.push ke halaman detail report dengan mengirimkan data-data yang diperlukan.
      - pada fitur report summary terdapat floating button, saat ditekan dengan memanfaatkan event hanndler on Pressed, maka halaman akan diredirect ke halaman form dengan memanfaatkan Navigator.push.
      - pada fitur form terdapat button untuk mensubmit laporan, saat ditekan dengan memanfaatkan event handler on Pressed, maka data pada form akan divalidasi dan kemudian diambil untuk disimpan pada objek laporan yang nantinya akan di POST ke database di railway melalui backend django.
   -  Fitur konsultasi <br>
      - Pafa fitur consultation summary, terdapat list yang berisi konsultasi yang dikirimkan oleh user yang sedang login. Satu cell yang ditekan dapat dilihat detail konsultasinya karena menggunakan event handler onTap(). Navigator akan mengarah ke halaman detail konsultasi dengan menggunakan Navigator.push() sesuai data-data yang diperlukan
      - Pada fitur consultation summary terdapat floating button untuk mengarahkan ke form konsultasi. Untuk event ini memanfaatkan onPressed(). Halaman form dipanggil dengan Navigator.push()
      - Pada fitur form, terdapat button untuk men-submit laporan. Ketika button ditekan, maka dengan event handler onPressed() akan menyimpan data-data yang dituliskan user menjadi objek yang nantikan akan di-POST ke database di railway. Hal ini memanfaatkan back-end django.
3. Admin page
    - Fitur Laporan <br>
      - Pada fitur report summary, akan terlihat list laporan yang dikirimkan oleh semua user. Setiap laporan yang ditekan dengan menggunakan event handler onTap(), maka akan diarahkan ke halaman detail laporan menggunakan Navigator.push() dengan mengirimkan data-data yang diperlukan.
      - Pada fitur detail report, terdapat FloatingActionButton yang ketika ditekan akan memanfaatkan event handler onPressed(). Event handler tersebut akan mengarahkan halaman menggunakan Navigator.push() ke halaman response report form.
      - Pada fitur response report form, terdapat button send response. Ketika button tersebut ditekan dengan menggunakan event handler onPressed(), maka data pada form akan divalidasi. Apabila data yang diinput valid, maka data tersebut akan disimpan pada objek response yang nantinya akan dilakukan POST ke database di railway melalui django.  
    - Fitur Konsultasi <br>
      - Pada fitur consultation summary, terdapat list yang berisi konsultasi yang dikirimkan oleh semua user. Satu cell bisa ditekan dengan menggunakan event handler onTap(), dan akan mengarahkan halaman menggunakan Navigator.push() ke halaman detail konsultasi dengan mengirimkan data-data yang diperlukan.
      - Pada fitur consultation detail, terdapat FloatingActionButton yang ketika ditekan dengan memanfaatkan event handler onPressed(), akan mengarahkan halaman menggunakan Navigator.push() ke halaman reply consultation form.
      - Pada fitur reply consultation form, terdapat button send reply yang ketika ditekan dengan memanfaatkan event handler onPressed(), akan memvalidasi data yang ada pada form dan apabila data yang diinput valid, maka data tersebut akan disimpan pada objek reply yang nantinya akan dilakukan POST ke database di railway melalui django.  
