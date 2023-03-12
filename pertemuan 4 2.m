i=imread('D:\pak aviv\pengolahan citra\matlab\Profil_aku.png');
s=imadjust(i,stretchlim(i,[0.05 0.95]),[]);

subplot(2,2,1), imshow(i), title('Original');
subplot(2,2,2), imshow(s), title('Stretched Image');
subplot(2,2,3), imshow(i), title('Histogram of Original Image');
subplot(2,2,4), imshow(s), title('Histogram of Stretched Image');