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

<p>Patterning adalah salah satu teknik sederhana untuk mendigitalisasi halftoning dengan merubah ukuran pixelnya. Misal yang awalnya berukuran 2x2, maka ketika dilakukan patterning ukurannya jadi berubah dimana setiap 1 pixel menjadi ukuran 2x2, maka ukuran akhirnya yang awalnya 2x2 menjadi 4x4.</p>

<h4>Berikut Algoritma Deskriptif Patterning:</h4>
<li>Menentukan banyaknya pola patterning. Misal menggunakan matriks ukuran 3x3, maka pola patternnya ada 10. Cara menghitungnya (3x3)+1 = 10</li>
<li>Menentukan range persebaran nilai untuk tiap pola guna membagi tingkat keabuannya. Cara menghitungnya 255 dibagi dengan jumlah pola.</li>
<li>Cocokkan setiap nilai pada matriks inputan / matriks citra dengan nilai dari tiap range pola.</li>

<h4>Code Patterning:</h4>

``` Octave
% membaca citra awal
img = imread("lenna.png");

% mendapatkan tinggi dan lebar suatu citra / ukuran
[img_height, img_width] = size(img);

% kuantisasi citra dari 0 - 255 ke 0 - 9
quantized_img = round(9/255 * img);

% buat sebuah wadah baru untuk citra patterning
pattern_img = zeros(3 * img_width);

% looping citra terkuantisasi
for x = 1:img_height
	for y = 1:img_width
		index = quantized_img(x, y) + 1;
		pattern = get_pattern(index);

		m = 1 + 3*(x - 1);
		n = 1 + 3*(y - 1);

		pattern_img(m:m + 2, n:n + 2)	= pattern;
	end
end

% menyimpan citra hasil patterning
imwrite(pattern_img, "hasil.png");
```

## 2. Algoritma Dithering

<p>Dithering membuat gambar keluaran dengan jumlah titik yang sama dengan jumlah pixel pada gambar aslinya. Dithering dilakukan  dengan  membandingkan  tiap  blok  dari  citra  asli dengan sebuah matriks  pembatas  yang  disebut  dengan <i>treshold</i>.</p>

<h4>Berikut Algoritma Deskriptif Dithering:</h4>
<li>Menghitung matriks treshold yang akan digunakan untuk membandingkan matriks citra.</li>
<li>Setelah matriks treshold didapatkan, untuk setiap nilai pada matriks citra dibandingkan dengan nilai matriks treshold.</li>
<li>Jika setelah dibandingkan didapati nilai matriks lebih besar dari treshold, maka matriks akan bernilai 1 / 255 dan berwarna putih.</li>
<li>Jika setelah dibandingkan didapati nilai matriks lebih kecil dari treshold, maka matriks akan bernilai 0 dan berwarna hitam.</li>

<h4>Code Dithering:</h4>

``` Octave
% membaca citra grayscale
img = imread("baboon.jpg");

% mendapatkan tinggi dan lebar citra / ukuran
[img_height, img_width] = size(img);


d1 = [
	0 128;
	192 64
];

d2 = [
	0 128 32 160;
	192 64 224 96;
	48 176 16 144;
	240 112 208 80
];

% Membuat matriks threshold yang ukurannya sama dengan matriks citra
threshold_img_d1 = repmat(d1, round(img_width/2), round(img_height/2));
threshold_img_d2 = repmat(d2, round(img_width/4), round(img_height/4));

% Melakukan dithering citra dengan membandingkan matriks citra dengan matriks threshold
dith_img_d1 = img > threshold_img_d1;
dith_img_d2 = img > threshold_img_d2;

% Plotting
subplot(1,3,1); imshow(img); title("Citra Original");

subplot(1,3,2); imshow(dith_img_d1); title("Hasil Dithering dengan D1");

subplot(1,3,3); imshow(dith_img_d2); title("Hasil Dithering dengan D2");

% menyimpan citra hasil dithering
imwrite(img, "original.jpg");
imwrite(dith_img_d1, "dith1.jpg");
imwrite(dith_img_d2, "dith2.jpg");
```

## 3. Algoritma Histogram Equalization

<p>Histogram equalization merupakan suatu operasi <i>Image
Enhancement</i> (peningkatan kualitas citra) yang bertujuan untuk
memperoleh histogram yang intensitasnya terdistribusi secara merata pada citra. Efeknya dapat digunakan untuk meningkatkan kontras secara
menyeluruh. Dengan demikian, citra yang memiliki histogram yang tidak merata akan menjadi citra yang lebih jelas karena derajat keabuannya
tidak dominan gelap atau dominan terang. Umumnya, histogram equalization biasanya dilakukan pada citra skala kelabu atau <i>grayscale</i>.</p>

<h4>Berikut Algoritma Deskriptif Histogram Equalization:</h4>
<li>Ambil nilai maksimal intensitas piksel pada citra yang ingin diterapkan histogram equalization.</li>
<li>Hitung frekuensi untuk tiap nilai intensitas piksel pada citra.</li>
<li>Hitung frekuensi kumulatif berdasarkan frekuensi tiap nilai intensitas piksel pada citra.</li>
<li>Normalisasi nilai intensitas piksel dengan membagi nilai frekuensi kumulatifnya dengan total semua nilai intensitas piksel pada citra.</li>
<li>Nilai piksel yang baru didapatkan dengan mengalikan hasil normalisasi dengan nilai maksimal intensitas piksel pada citra.</li>
<li>Untuk setiap nilai awal pada citra, ubah dengan nilai baru.</li>

<h4>Code Histogram Equalization:</h4>

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

<p>Bit-Plane Slicing merupakan metode yang digunakan untuk melihat kontribusi atau pengaruh dari tiap bit penyusun citra. Untuk citra 8 bit, pada dasarnya tiap intensitas yang nilainya dalam format decimal, bisa dipecah menjadi bit-bit dalam format biner. Misalnya, sebuah pixel dengan intensitas 245 (decimal) bila dijadikan biner adalah 11110101.</p>

<h4>Berikut Algoritma Deskriptif Bit-Plane Slicing:</h4>

<li>Membaca citra yang ingin digunakan dengan imread.</li>
<li>Jika citra masih rgb maka ubah dulu kedalam citra grayscale.</li>
<li>Ubah setiap angka dalam matriks menjadi bilangan biner.</li>
<li>Untuk setiap 1 angka di masing-masing matriks, secara berurutan dimulai dari yang paling kanan masukkan kedalam bentuk matriks lagi. Sehingga membentuk 8 buah matriks baru.</li>
<li>Matriks paling awal (kanan) adalah LSB (Least Significant Bit).</li>
<li>Matriks paling akhir (kiri) adalah MSB (Most Significant Bit).</li>

<h4>Code Bit-Plane Slicing:</h4>

```Octave
pkg load image

img = imread('img\img1.jpg');

% mengubah citra rgb ke grayscale
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

gray_img = (0.3*R) + (0.59*G) + (0.11*B);
subplot(3, 3, 1) ; imshow(gray_img) ; title("Citra Asli);

% menampilkan setiap bit slicing dengan fungsi bitget
figure(1);
for i = 1:8
  bit_img = bitget(gray_img, i);
  subplot(3, 3, i+1) ; imshow(bit_img); title(["Bit Plane ", num2str(i)]);
end
```