function hcode=huffman_encoder(I)
%creating a huffman directory
dict = huffDict(I);

%reshaping the image into vector form 
newvec=reshape(I,1,[]);

%encoding the data using huffman encoding
hcode=huffmanenco(newvec,dict);
end