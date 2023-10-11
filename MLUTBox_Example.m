
% ------------------------------------------------------------------------
%
% Very simple usage example of MLUTBox
%
% (C)2018 - G.PRESTI
% GPL license at the end of file
%
% ------------------------------------------------------------------------

% Prepare environment
addpath('lib');

% Generate probing image
% (see getFlatCLUT hel for details)
n = 25; 
img = getFlatCLUT( n );

% Save probing image to disk
imwrite(uint16(img*65535),['neutral-',num2str(n),'.tif']);

%% Process the saved file with whatever color-tweaker you want
% (here I simulate this by working directly on the img variable)

% Just messing around with color spaces
img = rgb2xyz(img, "colorspace", "srgb");
img = xyz2rgb(img, "colorspace", "adobe-rgb-1998");
imwrite(uint16(img*65535),['MessedColors-',num2str(n),'.tif']);

%% Load the processed file and save a .cube file 

% (see clut2cube hel for details)
inputname = ['MessedColors-',num2str(n),'.tif'];
cubeoutname = 'MessedColors.cube';
decimals = 10;

img = imread(inputname);
cube = clut2cube(img, cubeoutname, decimals);

% Plot cube
plotCube(cube,img);



% ------------------------------------------------------------------------
%
% MLUTBox_Example.m: Very simple usage example of MLUTBox
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