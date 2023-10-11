function [ img ] = getFlatCLUT( n )
% GETFLATCLUT returns a square RGB image containing an uniform sampling of
% the color space. Use this image to sample local image color changes of
% any process/device/medium.
%
% [ img ] = getFlatCLUT( n )
%
%   n : number of samples per channel
% img : output LxLx3 image, L = sqrt(n^3)
%
% WARNING: n must be a perfect square number in order to have an integer L
% ( 4 9 16 25 36 49 64 81 100 121 144 169 196 225 256 )
%
% Typical n values are:
% 16  : L=64,   samples 4096     colors (compact)
% 25  : L=125,  samples 15625    colors 
% 64  : L=512,  samples 262144   colors (typical)
% 196 : L=2744, samples 7529536  colors 
% 256 : L=4096, samples 16777216 colors (discouraged)
%
% (C)2018 G.Presti - GPL license at the end of file
% See also CLUT2CUBE

    l = sqrt(n^3);

    if round(l)~=l, error('n must be one of the following: {4 9 16 25 36 49 64 81 100 121 144 169 196 225 256}'); end

    r = linspace(0,1,n);
    g = linspace(0,1,n);
    b = linspace(0,1,n);

    r = repmat(r(:),[n^2,1]);
    g = repmat(g,[n, n]); g = g(:);
    b = repmat(b,[n^2,1]); b = b(:);

    r = reshape(r,l,l);
    g = reshape(g,l,l);
    b = reshape(b,l,l);

    img = cat(3,r,g,b);
end

% ------------------------------------------------------------------------
%
% getFlatCLUT.m: generate image containing uniform sampling of color space
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
