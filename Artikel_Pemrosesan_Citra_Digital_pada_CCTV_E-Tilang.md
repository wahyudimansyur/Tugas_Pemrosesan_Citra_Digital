# PEMROSESAN CITRA DIGITAL
ANGGOTA KELOMPOK: 1. ADELIA ERLYN NOR CANDRA PRASETYANA
                  2. RISMA WULANDARI

# Pengolahan Citra CCTV Pada Tilang Elektronik (Swerving & Blocking Jalur Pejalan Kaki)

### Apa itu CCTV?

**CCTV** digunakan sebagai kamera pengawas untuk mengawasi pergerakan suatu objek. Kebanyakan fungsinya hanya sebatas mengawasi secara random dan informasi yang kurang detail, hal tersebut cukup menyulitkan jika membutuhkan suatu informasi detail seperti plat nomor kendaraan, pejalan kaki, dan objek lainnya. Untuk menyelesaikan permasalahan tersebut, dapat diterapkan konsep deteksi gerakan. Deteksi gerakan digunakan untuk mengidentifikasi dan memilah objek yang diinginkan. Proses pendeteksian gerakan ini menggunakan konsep pengolahan citra _*(image processing)*_ dengan algoritma __*Frame Difference*__ dan __*Frame Substraction*__. 

<br>

<img src="ALGORITMA.png" style="width:70%"/><br><br>

<br>

### Algoritma Frame Difference & Substraction

<br>

**Algoritma Frame Difference** digunakan untuk memeriksa objek-objek pada citra. Apabila objek terdeteksi, maka diterapkan **algoritma Frame Substraction** untuk mendeteksi posisi objek dimana data posisi dikumpul menjadi gerakan. Hasil penelitian ini cukup mampu mendeteksi objek dan pergerakannya, berdasarkan hasil 25 pengujian dari video yang berbeda, presentase keberhasilanya mencapai 76,0%. Kesimpulanya adalah, Metode yang digunakan cukup berhasil mendeteksi pergerakan objek dalam video berdasarkan perbedaan _*(difference)*_ yang diperoleh dari pengurangan frame sebelumnya dan frame selanjutnya.

<br>

> - **Algoritma Frame Difference** ini akan digunakan untuk mengecek apakah ada perbedaan antara dua buah frame yang sedang dibandingkan. Apabila terdapat perbedaan, berarti ada pergerakan objek dalam citra frame tersebut. 

> - **Algoritma Frame Substraction** akan digunakan untuk mendeteksi posisi dari objek yang bergerak tersebut. Beberapa tahapan yang diperlukan dalam melakukan proses pendeteksian gerakan ini yaitu proses grayscale, binary image, segmentasi, deteksi, pelacakan, pengenalan, dan perhitungan. Kamera yang digunakan untuk mengambil gambar haruslah tidak bergerak. 

<br>

### Segmentasi Citra

<br>

**Citra** merupakan suatu cerminan, imitasi ataupun kemiripan dari sebuah objek, sebagai tempat keluaran dalam sebuah sistem perekaman. data yang didapat biasanya bersifat optik baik berbentuk foto dan dapat pula bersifat analog berupa video seperti yang biasa ditampilkan pada layar televisi dan lain sebaainya, atau bersifat digital yang bisa langsung disimpan pada media penyimpan seperti harddisk. Segmentasi citra adalah sebuah proses pengolahan citra yang tujuannya untuk memisahkan suatu kumpulan wilayah objek dengan kumpulan wilayah pada latar belakang yang berguna agar sebuah objek mudah dianalisis.

<br>

# PEMBAHASAN

<br>

Tampilan awal dari aplikasi Implementation Motion Capture pada Kamera CCTV dengan 
Algoritma _*Frame Difference*_ dan _*Frame Substraction*_ dapat dilihat pada gambar berikut:

<br>

<img src="Gambar1.png" style="width:50%"/><br><br>

Untuk melakukan proses ekstraksi _*file video*_ menjadi _*frame*_, maka pemakai dapat mengklik tombol Buka Video, sehingga sistem akan menampilkan _*form Video*_ seperti terlihat pada gambar berikut:

<br>

<img src="Gambar2.png" style="width:50%"/><br><br>

User dapat memilih _*file*_ video yang akan diproses dengan mengklik tombol Buka Video, sehingga sistem akan menampilkan _*form Browse*_ seperti terlihat pada gambar berikut:

<img src="Gambar3.png" style="width:50%"/><br><br>

Setelah selesai melakukan proses pemilihan _*file*_ yang diinginkan, maka user dapat mengklik tombol Open, sehingga sistem akan menampilkan _*form*_ Ekstrak File Video seperti 
terlihat pada gambar berikut:

<img src="Gambar4.png" style="width:50%"/><br><br>

Setelah berhasil mengekstrak video, maka _*user*_ dapat memulai proses pendeteksian pergerakan seperti terlihat pada gambar berikut:

<img src="Gambar5.png" style="width:50%"/><br><br>

Hasil difference dan substraction dari kedua frame diatas dapat dirincikan sebagai berikut:

<img src="Gambar6.png" style="width:50%"/><br><br>

Hasil proses pendeteksian pergerakan yang diperoleh dapat dilihat pada gambar berikut:

<img src="Gambar7.png" style="width:50%"/><br><br>

Pada beberapa tes uji, proses pendeteksian gerak dilakukan terhadap 25 data untuk diuji, data tersebut memiliki background dan kondisi cahaya yang berbeda. Hasil Proses pendeteksian pergerakan dengan _*frame differance*_ dan _*frame substraction*_ dapat dilihat pada tabel berikut:

<img src="Gambar8.png" style="width:50%"/><br><br>

<img src="Gambar9.png" style="width:50%"/><br><br>

Berdasarkan hasil pengujian dari 25 data diuji pada video diatas, maka dapat diperoleh bahwa pengaruh warna background, warna objek dan kondisi cahaya akan menentukan berhasil atau tidaknya pendeteksian gerak pada video. 

Dari tabel diatas dapat dianalisis dan diketahui berapa tingkat keberhasilan dari program pendeteksian gerakakan dengan kamera cctv ini. program ini mampu melakukan proses pendeteksian gerak sebanyak 19 data dari 25 data yang diuji, sehingga presentase keberhasilan dari program ini adalah sebagai berikut:
- Akurasi = 19/25 * 100 % = 76,0 %.
- Error Rate = 6/25 * 100 % = 24,0 %

Terdapat beberapa hal yang sudah dihasilkan dan dapat dianalisis dari pengunggahan citra adalah waktu sistem untuk memproses suatu frame guna mengetahui adanya gerakan, Belum 
dapat diketahui standar batasan yang baku untuk menentukan waktu respon ideal pada sebuah sistem pengunggahan citra, waktu ideal dapat ditentukan dengan besaran delay waktu dalam 
pemrosesanya.



