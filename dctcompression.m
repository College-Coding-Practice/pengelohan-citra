[filename,pathname]=uigetfile('','Select Grayscale Image');
filewithpath=strcat(pathname,filename);
img=double(imread(filewithpath)); %Reading Image

T=dctmtx(8); %Getting 8x8 transformation matrix
dct=@(block_struct)T*(block_struct.data)*T'; %Defining DCT operation
C=blockproc(img,[8,8],dct); %Finding DCT using block processing
mask = [11110000    %Defining mask for coeffs. truncation
        11100000
        11000000
        10000000
        00000000
        00000000
        00000000
        00000000]
%Truncation DCT coefficients
Ct=blockproc(C,[8,8],@(block_struct)(mask.*block_struct.data));

invdct=@(block_struct)T'*(block_struct.data)*T; %Defining IDCT operation
invC=blockproc(Ct,[8,8],invdct); %Finding Inverse DCT

%Writing Images for size comparison
imwrite(uint8(img),'Original_Image.jpg','quality',100);
imwrite(uint8(invC),'DCT_Crompessed_Image.jpg','quality',100);

%Displaying Image
figure
imshowpair=(img,invC,'montage')
title('Original Grayscale Image (Left) and DCT Compressed Image (Right)');