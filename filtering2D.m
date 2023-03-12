%Program for image filtering in frequency domain
[filename,pathname]=uigetfile('*.*','Select grayscale Image');
filewithpath=strcat(pathname,filename);
img=imread(filewithpath);

[row,col]=size(img);

F=fft2(double(img)); %DFT of iamge

Fs=fftshift(F); %Shifting spectrum to centre

H=myfilter2D('idealLPF',row,col,50); 
%H=imread('D:\pak aviv\pengolahan citra\pertemuan 6\DFT\saya.jpg')
%H=double(H/255)

Fsf=Fs.*H; %Filtering

fimg=ifft2(fftshift(Fsf)); %Inverse DFT
img=uint8(real(fimg));

subplot(221)
imshow(img);title('Input Image')

subplot(222)
imshow(log(1+abs(Fs)),[]);title('Magnitud Spectrum of Image')

subplot(223)
imshow(imgr,[]);title('Filtered Image')

subplot(224)
imshow(log(1+abs(Fsf)),[]);title('Magnitude Spectrum of Filtered Image')