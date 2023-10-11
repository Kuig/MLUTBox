function [ hc, hi ] = plotCube(cube, img)
% PLOTCUBE plots the color cube LUT data
%
%   [ hc ]     = plotCube(cube)
%   [ hc, hi ] = plotCube(cube, img)
%
%   cube : Cube array
%    img : Reference image
%
%     h* : Plot handles
%
% (C)2018 G.Presti - GPL license at the end of file
% See also CLUT2CUBE

    if nargin < 2
        hc = plcu(cube);
    else
        subplot(1,2,1), hi = image(img); axis image;
        subplot(1,2,2), hc = plcu(cube);
    end

end

function [ h ] = plcu (cube)

    h = scatter3(cube(:,1),cube(:,2),cube(:,3),32,cube,'.');
    rotate3d on, view([135,34]); axis equal;
    xlabel('Red');
    ylabel('Green');
    zlabel('Blue');
end

% ------------------------------------------------------------------------
%
% plotCube.m: Plots the color cube LUT data
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