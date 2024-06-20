function [letterORnumConversion] = letter2numberDico(char)
%LETTER2NUMBERDICO Summary of this function goes here
%   If char is a letter, it converts to number but if char is a number it
%   converts to a letter
clc;
letter = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',...
         'p','q','r','s','t','u','v','w','x','y','z'];
number = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
converted='';
if class(char)=="double"
    if char>length(number)
        while char > length(number)
            if floor(char/length(number))<=1
                converted=converted+letter2numberDico(mod(char,length(number)));
            end
            converted=converted + letter2numberDico( mod(length(number),char) );
            char = char - length(number);
        end
    end
    index=find(number==char);
    converted=converted + letter(index);
    letterORnumConversion=converted;
elseif class(char)=="string" || class(char)=="char"
    char = convertStringsToChars(lower(char));
    index=find(letter==char);
    letterORnumConversion=number(index);
end

end

