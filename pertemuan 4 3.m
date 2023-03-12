I=imread('D:\pak aviv\pengolahan citra\matlab\Profil_aku.png');
Ihsv=rgb2hsv(I);
Ih=histeq(Ihsv(:,:,3));
Ihsv(:,:,3)=Ih;
Io=hsv2rgb(Ihsv);

subplot(1,2,1), imshow(I), title('Original Image');
subplot(1,2,2), imshow(Ihsv), title('Color Histogram');