function a = BOLineLineAngle2D(x1,x2,x3,x4,type,rd)
%%  BOLineLineAngle2D - calculates angle between two lines
%   
%   REFERENCE:
%
%   INPUT:
%       x1,x2   - endpoints of first line,
%       x3,x4   - endpoints of second line,
%       type    - 0 -> [-PI PI]; 1 -> [0 PI]; 2 -> [0 2PI],
%       rd      - 1 -> degree.
%
%   OUTPUT:
%       a       - angle
%
%   HELP:
%                (x4)
%                /
%       (x1)----/----(x2)
%              /
%           (x3)
%
%   USAGE:
%       a = BOLineLineAngle2D(x1,x2,x3,x4,0,1)
%
%   AUTHOR:
%       Boguslaw Obara, http://boguslawobara.net/
%
%   VERSION:
%       0.1 - 21/05/2010 First implementation

%% Setup
if nargin<6; rd = 0;    end
if nargin<5; type = 0;  end
%% Calculate angle
a = BOVectorVectorAngle2D(x2-x1,x4-x3,type,rd);
end