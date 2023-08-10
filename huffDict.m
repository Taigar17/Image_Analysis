function dict=huffDict(I)
%open text file
info = fopen('image1.txt',"w");
%getting the image size in m x n form 
[m,n] = size(I);
%counting the total counts 
Totalcount=m*n;
%creating unique symbols
symbols = unique(I);
%counts the number of symbols
counts=histc(I(:),symbols);
%caculating the probabilities 
pro=counts./Totalcount;

%creating huffman directory and getting the average length code
[dict,avglen]=huffmandict(symbols,pro);
disp('the average length of the code is :');
disp(avglen);
%writes average length code to text file
fprintf(info,"the average length of the code is : %d\n",avglen);

%calculating entropy
ntropy=entropy(uint8(I));
disp('Entropy is:');
disp(ntropy);
%writing entropy data to text file
fprintf(info,"Entropy is: %d\n",ntropy);

%caculating efficiency
E=(ntropy/avglen)*100;
disp('Efficiency is:');
disp(E);
%writing efficiency to text file 
fprintf(info,"Efficiency is: %d\n",E);

%caculating compression ratio
disp('Compression ratio is:');
CompressionRatio=(Totalcount*8)/(Totalcount*avglen)
%writing compressio ratio to text file
fprintf(info,"Compression ratio is: %d\n",CompressionRatio);

%caculating redundancy
disp('Relative data redundancy is:');
redundancy = (1 - (1/CompressionRatio))*100
%writing data reducndacy to text file
fprintf(info,"Relative data redundancy is: %d\n",redundancy);
disp("----------------------------------------------------------")
%closing an open text file
fclose(info);
end