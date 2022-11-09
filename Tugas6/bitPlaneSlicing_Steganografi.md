## Nama : Risma Wulandari
## NIM : 2110131220008

<br><h1 align="center">Tugas Bit Plane Slicing dan Steganografi</h1>

## 1. Eksperimen dengan gambar sendiri
<p align="justify">Pertama, ubah citra yang kita punya menjadi ukuran 512 x 512 pixel.</p>
<p align="center"><img src="img/langkah1.PNG"></p>
<p align="justify">Sehingga hasil citra yang diperoleh seperti gambar dibawah.</p>
<p align="center"><img src="img/img1.jpg"></p>

<p align="justify">Selanjutnya, kita akan melakukan Bit-Plane Slicing. Untuk code nya bisa dilihat dibawah.</p>

```Octave
img = imread('img\img1.jpg');

% mengubah citra rgb ke grayscale
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

gray_img = (0.3*R) + (0.59*G) + (0.11*B);
subplot(3, 3, 1) ; imshow(gray_img) ; title("Citra Asli");

% menampilkan setiap bit slicing dengan fungsi bitget
figure(1);
for i = 1:8
  bit_img = bitget(gray_img, i);
  subplot(3, 3, i+1) ; imshow(bit_img); title(["Bit Plane ", num2str(i)]);
end
```

<p align="justify">Output yang diperoleh berdasarkan code diatas adalah:</p>
<p align="center"><img src="img/bitplaneimg.PNG"></p>

## 2. Eksperimen dengan gambar teman
<p align="justify">Jika tadi bereksperimen hanya dengan satu citra, maka kali ini kita akan menggabungkan dua citra dan melihat Bit-Plane Slicingnya. Pertama, ubah kedua citra yang kita punya menjadi ukuran 512 x 512 pixel. Untuk caranya sama seperti yang diawal tadi.</p>
<p align="center"><img src="img/citraasligabungan.PNG"></p>
<p align="justify">Selanjutnya, kita akan melakukan Bit-Plane Slicing lagi untuk citra gabungan ini. Untuk code nya bisa dilihat dibawah.</p>

```Octave
pkg load image

img1 = imread('img\img1.jpg');
img2 = imread('img\img2.jpg');

% menggabungkan dua buah citra
gabungan = imadd(img1, img2);

% mengubah citra rgb ke grayscale
R = gabungan(:,:,1);
G = gabungan(:,:,2);
B = gabungan(:,:,3);

gray_img = (0.3*R) + (0.59*G) + (0.11*B);
subplot(3, 3, 1) ; imshow(gray_img) ; title("Citra Asli Gabungan");

% menampilkan setiap bit slicing dengan fungsi bitget
figure(1);
for i = 1:8
  bit_img = bitget(gray_img, i);
  subplot(3, 3, i+1) ; imshow(bit_img); title(["Bit Plane ", num2str(i)]);
end
```

<p align="justify">Output yang diperoleh berdasarkan code diatas adalah:</p>
<p align="center"><img src="img/bitplaneimg.PNG"></p>