[![Pre-Release](https://github.com/IkhlasulHanif/proyek-tugas-akhir/actions/workflows/pre-release.yml/badge.svg)](https://github.com/KingGedorah/share-eat/actions/workflows/pre-release.yaml)
[![Release](https://github.com/IkhlasulHanif/proyek-tugas-akhir/actions/workflows/release.yml/badge.svg)](https://github.com/IkhlasulHanif/proyek-tugas-akhir/actions/workflows/release.yml) 

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

