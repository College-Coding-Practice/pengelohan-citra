%Program to find impulse response H(u,v) of 2D-filters
M=200;  N=200;  D0=20;  n=1;
HidealLPF=myfilter2D('idealLPF',M,N,D0);
HbutterLPF=myfilter2D('butterLPF',M,N,D0,n);
HgaussianLPF=myfilter2D('gaussianLPF',M,N,D0);

HidealHPF=myfilter2D('idealHPF',M,N,D0);
HbutterHPF=myfilter2D('butterHPF',M,N,D0,n);
HgaussianHPF=myfilter2D('gaussianHPF',M,N,D0);
%-------------------------------------------------------
figure
subplot(231)
imshow(HidealLPF,[]); title('Ideal Low Pass Filter')
subplot(232)
imshow(HbutterLPF,[]); title('Butterworth Low Pass Filter')
subplot(233)
imshow(HgaussianLPF,[]); title('Gaussian Low Pass Filter')
subplot(234)
imshow(HidealLPF,[]); title('Ideal Low Pass Filter(3D)')
subplot(235)
imshow(HbutterLPF,[]); title('Butterworth Low Pass Filter(3D)')
subplot(236)
mesh(HgaussianLPF); title('Gaussian Low Pass Filter(3D)')
%-------------------------------------------------------
figure
subplot(231)
imshow(HidealHPF,[]); title('Ideal High Pass Filter')
subplot(232)
imshow(HbutterHPF,[]); title('Butterworth High Pass Filter')
subplot(233)
imshow(HgaussianHPF,[]); title('Gaussian High Pass Filter')
subplot(234)
imshow(HidealHPF,[]); title('Ideal High Pass Filter(3D)')
subplot(235)
imshow(HbutterHPF,[]); title('Butterworth High Pass Filter(3D)')
subplot(236)
mesh(HgaussianHPF); title('Gaussian High Pass Filter(3D)')