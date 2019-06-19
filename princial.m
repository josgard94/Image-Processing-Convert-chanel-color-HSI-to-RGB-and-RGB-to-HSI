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