

%%
close all;
clear all;
clc;
%read the image 
I = imread('kinect-dinosaur.bmp');

%resize the image
 %I = imresize(I,0.4,"nearest");
 %imwrite(I,'resizeimg.bmp');

% display the pixel value of Image
disp('the pixel values are:');
disp(I);

%plotting an image
subplot(1,2,1);
imshow(uint8(I));
title('Original image');

%creating a huffman Dictionary
dict = huffDict(I);

% main loop for looping the huffman encoding and decoding image RGB
for i = 1:3
    %image size 
    [m,n] = size(I(:,:,i));
    %encoding the image
hcode = huffman_encoder(I(:,:,i));

%displaying the image
disp('The Huffman encoded code is:');
disp(hcode);

%writing huffman encoded data to file
hdata = fopen('huffdata.txt','w');
fprintf(hdata,"%d",hcode);
fclose(hdata);

%decoding the image
HD1 = huffman_decoder(I(:,:,i),hcode);

%displying the image
disp('The Huffman decoded code is:');
disp(HD1);

HD=uint8(HD1);
%restoring the image
Restore=reshape(HD,[],n);
I2 = Restore;

%putting RGB image data together to make the image
if i == 1
    R = I2;
elseif i == 2
    G = I2;
elseif i == 3
    B = I2;

% combining 3 chanels together into new image
     N(:,:,1) = R;
  N(:,:,2) = G;
  N(:,:,3) = B;

  %ploatting an image 
  subplot(1,2,2);
    imshow(uint8(N));
    title('Decoded Image');
    % writing image to the disk
    imwrite(N,'bmpimg.bmp');
    %caculating mean-sqaure error
    meanSqaureErr = immse(I,N);
end
 
end