function [ img ] = im2float( img )
% IM2FLOAT turns image data to floating point values matrix
%
% (C)2018 G.Presti - GPL license at the end of file

    switch(class(img))
        case 'uint16'
            sc = 65535;
        case 'uint8'
            sc = 255;
        otherwise
            sc = 1;
    end

    img = double(img);
    img = img./sc;

end

% ------------------------------------------------------------------------
%
% im2float.m: Image data to floating point values matrix
% Copyright (C) 2018 - Giorgio Presti
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>
%
% ------------------------------------------------------------------------