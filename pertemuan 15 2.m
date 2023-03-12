clc;clear;close all;
 
image_folder = 'Citra Uji';
filenames = dir(fullfile(image_folder, '*.jpg'));
total_images = numel(filenames);
 
for n = 1:total_images
    full_name= fullfile(image_folder, filenames(n).name);
    I = imread(full_name);
    J = I(:,:,1);
    K = im2bw(J,.6);
    L = imcomplement(K);
    str = strel('disk',5);
    M = imclose(L,str);
    N = imfill(M,'holes');
    O = bwareaopen(N,5000);
    stats = regionprops(O,'Area','Perimeter','Eccentricity');
    area(n) = stats.Area;
    perimeter(n) = stats.Perimeter;
    metric(n) = 4*pi*area(n)/(perimeter(n)^2);
    eccentricity(n) = stats.Eccentricity;
end
 
input = [metric;eccentricity];
target = zeros(1,16);
target(:,1:4) = 1;
target(:,5:8) = 2;
target(:,9:12) = 3;
target(:,13:16) = 4;
 
load net
output = round(sim(net,input));
 
[m,n] = find(output==target);
akurasi = sum(m)/total_images*100