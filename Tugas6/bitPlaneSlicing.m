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
