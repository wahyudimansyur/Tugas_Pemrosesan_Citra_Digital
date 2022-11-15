|  Nama | NIM | Tugas |
| :------------------:| :--------------:| :-----------------------------: |
| Risma Wulandari | 2110131220008 | Membuat algoritma deskriptif untuk patterning, dithering, histogram equalization, dan bit plane slicing |

<!DOCTYPE html>
<head>
    <style>
        thead {
            background-color: lightcoral;
            text-align: center;
        }
        table {
            border-collapse: collapse;
            border: 1px solid lightcoral;
            color: black;
        }
        p {
            text-align: justify;
        }
    </style>
</head>
<body>
</body>
</html>

# Algoritma Patterning, Dithering, Histogram Equalization, Bit-Plane Slicing

## 1. Algoritma Patterning
## 2. Algoritma Dithering
## 3. Algoritma Histogram Equalization

<p>Histogram equalization merupakan suatu operasi <i>Image
Enhancement</i> (peningkatan kualitas citra) yang bertujuan untuk
memperoleh histogram yang intensitasnya terdistribusi secara merata pada citra. Efeknya dapat digunakan untuk meningkatkan kontras secara
menyeluruh. Dengan demikian, citra yang memiliki histogram yang tidak merata akan menjadi citra yang lebih jelas karena derajat keabuannya
tidak dominan gelap atau dominan terang. Umumnya, histogram equalization biasanya dilakukan pada citra skala kelabu atau <i>grayscale</i>.</p>

<h4>Berikut Algoritma Deskriptif Histogram Equalization:</h4>
<li>Ambil nilai maksimal intensitas piksel pada citra yang ingin
diterapkan histogram equalization.</li>
<li>Hitung frekuensi untuk tiap nilai intensitas piksel pada citra.</li>
<li>Hitung frekuensi kumulatif berdasarkan frekuensi tiap nilai
intensitas piksel pada citra.</li>
<li>Normalisasi nilai intensitas piksel dengan membagi nilai frekuensi
kumulatifnya dengan total semua nilai intensitas piksel pada citra.</li>
<li>Nilai piksel yang baru didapatkan dengan mengalikan hasil
normalisasi dengan nilai maksimal intensitas piksel pada citra.</li>
<li>Untuk setiap nilai awal pada citra, ubah dengan nilai baru.</li>

<p>Pseudocode Histogram Equalization:</p>

```Octave
img = imread("stego.png");

hist_img = img;

total_piksel = rows(img) * columns(img);   % cara lain yang lebih singkat
max_piksel = max(max(img));

fk = 0;

for i = 0:max_piksel  % kenapa dari 0,karena nilai matriksnya ada yang 0
  % dapatkan frekuensi untuk tiap piksel
  frekuensi_pixel = sum(img(:) == i);

  %d dapatkan frekuensi kumulatif
  fk += frekuensi_pixel;

  % normalisasi
  norm_piksel = fk / total_piksel;

  % dapatkan nilai piksel baru
  new_piksel = round(norm_piksel * max_piksel);

  % ubah piksel lama dengan piksel baru
  hist_img(img == i) = new_piksel;
end
```

## 4. Algoritma Bit-Plane Slicing
Bit-Plane Slicing merupakan metode yang digunakan untuk melihat kontribusi atau pengaruh dari tiap bit penyusun citra. Untuk citra 8 bit, pada dasarnya tiap intensitas yang nilainya dalam format desimal, bisa dipecah menjadi bit-bit dalam format biner.

### Algoritma / Langkah-Langkah
### 1. Inputan Citra Binner / Matriks
### 2. Mengubah Angka Desimal menjadi Biner
### 3. Diubah ke bentuk matriks-matriks kecil