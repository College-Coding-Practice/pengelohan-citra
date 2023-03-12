 %%Accesing Pixel Values of an RGB Image
 color_image=imread('D:\pak aviv\pengolahan citra\matlab\Profil.jpg');
 red_value=color_image(50,70,1);
 green_value=color_image(50,70,2);
 blue_value=color_image(50,70,3);
 
 sprintf('Value of teh red, green and blue pixel is %d, %d, %d',red_value,green_value,blue_value)