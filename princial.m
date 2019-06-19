%   Autor: Edgard Diaz
%   contact: e.diaz@nartsoft.com.mx
%   date: 10 - 06 - 2019
%   Codigo princial, ejecuta los archivos que reliazan las conversiones de RGB a HSI y de HSI a RGB

clear,clc
imagen = imread("bridge.tif");

[H,S,I] = ConvertRgbToHsi(im2double(imagen));
imgHSI = cat(3,H,S,I);
figure(2)
imshow(im2uint8(imgHSI));
figure(1)
subplot(1,2,1);
imshow(im2uint8(imagen));
[R,G,B] = ConvertHsiToRgb(im2double(imgHSI));
imgRGB = im2uint8(cat(3,R,G,B));

subplot(1,2,2);
imshow(imgRGB);
