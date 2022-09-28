pkg load image
gambar = imread('C:\Users\USER\Documents\KULIAH\SEMESTER 3\PCD\Tugas_Pemrosesan_Citra_Digital\Tugas4\img\picture.jpg');
imshow (gambar);

R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

lightness = (min(R,G,B)+max(R,G,B))/2;
average = (R+G+B)/3;
luminosity = (0.3*R)+(0.59*G)+(0.11*B);

figure(1);
subplot(2,2,1);imshow(gambar);title('Gambar Asli');
subplot(2,2,2);imshow(lightness);title('Lightness Method');
subplot(2,2,3);imshow(average);title('Average Method');
subplot(2,2,4);imshow(luminosity);title('Luminosity Method');
