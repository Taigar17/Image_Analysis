function hdecode=huffman_decoder(I,hcode)
%creating huffman directory
dict = huffDict(I);
%decoding the encoded code
hdecode=huffmandeco(hcode,dict);
end