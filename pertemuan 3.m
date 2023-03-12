clc;
clear all;
close all;
a=imread('D:\pak aviv\pengolahan citra\matlab\mine.jpg');   %to read the image
b=rgb2gray(a);          %to convert the RGB image into monochrome image
[r,c]=size(b);          %to find the number of rows and columns in the monochrome image
d=((2^8)-1)-b;          %to convert the monochrome image to the negative image
subplot(1,2,1);
imshow(b);              %to show the original image
title('monochrome image');
subplot(1,2,2);
imshow(d);              %to show the negative image
title('negative image')