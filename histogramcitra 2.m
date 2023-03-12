clc;clear;close all;
Img = imread('peppers.png');
 
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
 
Red = cat(3,R,G*0,B*0);
Green = cat(3,R*0,G,B*0);
Blue = cat(3,R*0,G*0,B);
 
Gray = rgb2gray(Img);
 
rmap = zeros(256,3);
rmap(:,1) = 0:255;
rmap = rmap/255;
 
gmap = zeros(256,3);
gmap(:,2) = 0:255;
gmap = gmap/255;
 
bmap = zeros(256,3);
bmap(:,3) = 0:255;
bmap = bmap/255;
 
figure,
imshow(Img);
 
figure,
histogram(R(:),256,'FaceColor','r','EdgeColor','r')
hold on
histogram(G(:),256,'FaceColor','g','EdgeColor','g')
histogram(B(:),256,'FaceColor','b','EdgeColor','b')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 10000])
hold off
 
figure,
imshow(Red), colormap(rmap), colorbar
 
figure,
histogram(R(:),256,'FaceColor','r','EdgeColor','r')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 10000])
grid on
 
figure,
imshow(Green), colormap(gmap), colorbar
 
figure,
histogram(G(:),256,'FaceColor','g','EdgeColor','g')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 10000])
grid on
 
figure,
imshow(Blue), colormap(bmap), colorbar
 
figure,
histogram(B(:),256,'FaceColor','b','EdgeColor','b')
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 10000])
grid on
 
figure,
imshow(Gray), colormap(gray), colorbar
 
figure,
histogram(Gray(:),256,'FaceColor',[.5 .5 .5],'EdgeColor',[.5 .5 .5])
set(gca,'XLim',[0 255])
set(gca,'YLim',[0 10000])
grid on