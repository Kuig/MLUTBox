function [ cube ] = clut2cube( infile, outfile, decimals )
%CLUT2CUBE Summary of this function goes here
%
% [ cube ] = clut2cube( infile )
% [ cube ] = clut2cube( image )
% [ _ ]    = clut2cube( _, outfile, decimals )
%
%   infile : Image file name (generated with GETFLATCLUT and processed)
%    image : Image data (in case it has already been loaded)
%  outfile : Output .cube file name (optional)
% decimals : Precision, since .cube is a text format (default: 6)
%
%     cube : Output Cube LUT as an Nx3 array
%
% (C)2018 G.Presti - GPL license at the end of file
% See also GETFLATCLUT, PLOTCUBE

    if ischar(infile)
        img = imread(infile);
    else
        img = infile;
    end
    
    img = im2float(img);
    
    l = size(img,1);
    n = nthroot(l,3)^2;
    
    r1 = img(:,:,1); r1 = r1(:);
    g1 = img(:,:,2); g1 = g1(:);
    b1 = img(:,:,3); b1 = b1(:);

    cube = [r1,g1,b1];

    if nargin > 1
        if nargin < 3, decimals = 6; end
        comment = '# Created with MLUTBox; a software by Giorgio Presti\n';
        head = 'TITLE "SAMPLED_LUT"\n\nDOMAIN_MIN 0 0 0\n\nDOMAIN_MAX 1 1 1\n\n';
        cubSize = ['LUT_3D_SIZE ', num2str(n), '\n\n'];
        dc = num2str(decimals);
        dataFormat = ['%1.',dc,'f %1.',dc,'f %1.',dc,'f\n'];

        fileID = fopen(outfile,'w');
        fprintf(fileID,comment);
        fprintf(fileID,head);
        fprintf(fileID,cubSize);
        fprintf(fileID,dataFormat,cube.');
        fclose(fileID);
    end

end

% ------------------------------------------------------------------------
%
% clut2cube.m: 2D color LUT to 3D LUT (CUBE format)
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
