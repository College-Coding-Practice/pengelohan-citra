%program to compute 2D FFT of a square function and a natural image
f0=imread('F0.bmp');
f1=imread('F1.bmp');
f2=imread('F2.bmp');
img=imread('Lena.bmp');
%------------------------ 
F0=abs(fftshift(fft2(f0))); %finding magnitude spectrum
F1=abs(fftshift(fft2(f1)));
F2=abs(fftshift(fft2(f2)));
Fimg=abs(fftshift(fft2(img)));
%------------------------ 
subplot(331)
imshow(f0);title('Image1(Spatial domain)')
subplot(332)
imshow(f1);title('Image2(Spatial domain)')
subplot(333)
imshow(f2);title('Image3(Spatial domain)')
%----------------------------------------------------------
subplot(334)
imshow(log(1+F0),[]); title('Mag.Spectrum of Image1')
subplot(335)
imshow(log(1+F1),[]); title('Mag.Spectrum of Image2')
subplot(336)
imshow(log(1+F2),[]); title('Mag.Spectrum of Image3')
%----------------------------------------------------------
subplot(337)
mesh(F0); title('Mag.Spectrum of Image1 (3D)')
subplot(338)
mesh(F1); title('Mag.Spectrum of Image2 (3D)')
subplot(339)
mesh(F2); title('Mag.Spectrum of Image3 (3D)')
%----------------------------------------------------------
figure
subplot(121)
imshow(img); title('Lena in Spatial domain')
subplot(122)
imshow(log(1+Fimg),[]); title('Lena in Freq.domain')