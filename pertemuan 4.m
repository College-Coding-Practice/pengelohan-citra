%Accesing Pixel Values
image_variable=imread('D:\pak aviv\pengolahan citra\matlab\Profil.jpg');
gray_image=rgb2gray(image_variable);

pixel_value=gray_image(60,70);
sprintf('The value of the pixel is %d', pixel_value)