%2D Convolution
color_image=imread('D:\pak aviv\pengolahan citra\matlab\1573307246631.jpg');
gray_image=rgb2gray(color_image);
gray_image=double(gray_image);

PSF=fspecial('gaussian',[5 5],2);
motion_filter=fspecial('motion',10,45);

convolution_with_gaussian_filter = conv2(PSF,gray_image);
convolution_with_motion_filter = imfilter(gray_image,motion_filter,'replicate');
self_convolution=conv2(gray_image,gray_image);

subplot(2,2,1),imshow(color_image,[]);title('Original Image');
subplot(2,2,2),imshow(convolution_with_gaussian_filter,[]);title('Gaussian Filter');
subplot(2,2,3),imshow(convolution_with_motion_filter,[]);title('Motion Filter');
subplot(2,2,4),imshow(self_convolution,[]);title('Self Convolution');