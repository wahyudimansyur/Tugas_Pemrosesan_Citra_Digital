pkg load image

img = imread('littlePony.jpg');
cover_img = rgb2gray(img);
[img_height, img_width] = size(cover_img);

% mengidentifikasi pesan yang akan dimasukkan
pesan = "Risma Wulandari 2110131220008";
panjang_pesan = length(pesan);

% menggunakan fungsi uint untuk mengambil ascii
ascii_pesan = uint8(pesan);

% mengambil nilai biner dari pesan_mengubah decimal ke binar
biner_pesan = dec2bin(ascii_pesan, 8);  % ini mengembalikan menjadi string

% supaya jadi 1 baris aja, di transpose 2x
biner_pesan = transpose(biner_pesan);
biner_pesan = biner_pesan(:);
biner_pesan = str2num(biner_pesan);

% copy cover ke citra hasil
stego_img = cover_img;

% tranverse cover img
counter = 1;

for x = 1:img_height
  for y = 1:img_width
    if (counter <= panjang_pesan)
      LSB = bitget(stego_img(x,y), 1);
      BPS = biner_pesan(counter);
      temp = xor(LSB, BPS);
      stego_img(x,y) = cover_img(x,y) + temp;
      counter = counter + 1;
    else
      break;
    end
  end
end

% simpan gambar
imwrite(stego_img, "stegoLittlePony.png")

lsb_before = bitget(cover_img, 1);
lsb_after = bitget(stego_img, 1);

subplot(2,2,1); imshow(cover_img);title("Citra Grayscale Biasa");
subplot(2,2,2); imshow(stego_img);title("Citra Steganografi");
subplot(2,2,3); imshow(lsb_before);
subplot(2,2,4); imshow(lsb_after);
