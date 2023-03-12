clc;clear;close all;
 
image_folder = 'Citra Latih';
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
target = zeros(1,24);
target(:,1:6) = 1;
target(:,7:12) = 2;
target(:,13:18) = 3;
target(:,19:24) = 4;
 
net = newff(input,target,[10 5],{'logsig','logsig'},'trainlm');
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-6;
net = train(net,input,target);
output = round(sim(net,input));
save net.mat net
 
[m,n] = find(output==target);
akurasi = sum(m)/total_images*100