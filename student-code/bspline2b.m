%
%  To display a cubic B-sline given by de Boor control points
%   d_0, ..., d_N  
%
% Input points: left click for the d's then press enter (or return, or right click)  
%
%  Performs a loop from 1 to N - 2 to compute the Bezier
%  points using de Casteljau subdivision
%  nn is the subdivision level
%
%  This version also outputs the x-coodinates and the y-coordinates
%  of all the control points of the Bezier segments stored in
%  Bx(N-2,4) and By(N-2,4)
%

function [Bx, By] = bspline2b(dx,dy,N,nn,drawb)
% Works if N >= 4.

dim_data = 2;
Bx = zeros(N - 2, 4);
By = zeros(N - 2, 4);

if N < 4
   error("N must be greater than or equal to 4"); 
end

for i = 1:(N - 2)
    if i == N - 2
        if N == 4
            Bx(i, 1) = 1/4*dx(i) + 1/2*dx(i + 1) + 1/4*dx(i + 2);
            By(i, 1) = 1/4*dy(i) + 1/2*dy(i + 1) + 1/4*dy(i + 2);
        else
            Bx(i, 1) = 1/6*dx(i) + 7/12*dx(i + 1) + 1/4*dx(i + 2);
            By(i, 1) = 1/6*dy(i) + 7/12*dy(i + 1) + 1/4*dy(i + 2);
        end
        Bx(i, 2) = 1/2*dx(i + 1) + 1/2*dx(i + 2);
        By(i, 2) = 1/2*dy(i + 1) + 1/2*dy(i + 2);
        Bx(i, 3) = dx(i + 2);
        By(i, 3) = dy(i + 2);
        Bx(i, 4) = dx(i + 3);
        By(i, 4) = dy(i + 3);
    elseif i == 1
        Bx(i, 1) = dx(i);
        By(i, 1) = dy(i);
        Bx(i, 2) = dx(i + 1);
        By(i, 2) = dy(i + 1);
        Bx(i, 3) = 1/2*dx(i + 1) + 1/2*dx(i + 2);
        By(i, 3) = 1/2*dy(i + 1) + 1/2*dy(i + 2);
        if N == 4
            Bx(i, 4) = 1/4*dx(i + 1) + 1/2*dx(i + 2) + 1/4*dx(i + 3);
            By(i, 4) = 1/4*dy(i + 1) + 1/2*dy(i + 2) + 1/4*dy(i + 3);
        else
            Bx(i, 4) = 1/4*dx(i + 1) + 7/12*dx(i + 2) + 1/6*dx(i + 3);
            By(i, 4) = 1/4*dy(i + 1) + 7/12*dy(i + 2) + 1/6*dy(i + 3);
        end
    elseif i == N - 3
        if N == 5
            Bx(i, 1) = 1/4*dx(i) + 7/12*dx(i + 1) + 1/6*dx(i + 2);
            By(i, 1) = 1/4*dy(i) + 7/12*dy(i + 1) + 1/6*dy(i + 2);
        else
            Bx(i, 1) = 1/6*dx(i) + 4/6*dx(i + 1) + 1/6*dx(i + 2);
            By(i, 1) = 1/6*dy(i) + 4/6*dy(i + 1) + 1/6*dy(i + 2);
        end
        Bx(i, 2) = 2/3*dx(i + 1) + 1/3*dx(i + 2);
        By(i, 2) = 2/3*dy(i + 1) + 1/3*dy(i + 2);
        Bx(i, 3) = 1/3*dx(i + 1) + 2/3*dx(i + 2);
        By(i, 3) = 1/3*dy(i + 1) + 2/3*dy(i + 2);
        if N == 4
            Bx(i, 4) = 1/4*dx(i + 1) + 1/2*dx(i + 2) + 1/4*dx(i + 3);
            By(i, 4) = 1/4*dy(i + 1) + 1/2*dy(i + 2) + 1/4*dy(i + 3);
        else
            Bx(i, 4) = 1/6*dx(i + 1) + 7/12*dx(i + 2) + 1/4*dx(i + 3);
            By(i, 4) = 1/6*dy(i + 1) + 7/12*dy(i + 2) + 1/4*dy(i + 3);
        end
    elseif i == 2
        if N == 4
            Bx(i, 1) = 1/4*dx(i) + 1/2*dx(i + 1) + 1/4*dx(i + 2);
            By(i, 1) = 1/4*dy(i) + 1/2*dy(i + 1) + 1/4*dy(i + 2);
        else
            Bx(i, 1) = 1/4*dx(i) + 7/12*dx(i + 1) + 1/6*dx(i + 2);
            By(i, 1) = 1/4*dy(i) + 7/12*dy(i + 1) + 1/6*dy(i + 2);
        end
        Bx(i, 2) = 2/3*dx(i + 1) + 1/3*dx(i + 2);
        By(i, 2) = 2/3*dy(i + 1) + 1/3*dy(i + 2);
        Bx(i, 3) = 1/3*dx(i + 1) + 2/3*dx(i + 2);
        By(i, 3) = 1/3*dy(i + 1) + 2/3*dy(i + 2);
        Bx(i, 4) = 1/6*dx(i + 1) + 4/6*dx(i + 2) + 1/6*dx(i + 3);
        By(i, 4) = 1/6*dy(i + 1) + 4/6*dy(i + 2) + 1/6*dy(i + 3);
    else
        Bx(i, 1) = 1/6*dx(i) + 4/6*dx(i + 1) + 1/6*dx(i + 2);
        By(i, 1) = 1/6*dy(i) + 4/6*dy(i + 1) + 1/6*dy(i + 2);
        Bx(i, 2) = 2/3*dx(i + 1) + 1/3*dx(i + 2);
        By(i, 2) = 2/3*dy(i + 1) + 1/3*dy(i + 2);
        Bx(i, 3) = 1/3*dx(i + 1) + 2/3*dx(i + 2);
        By(i, 3) = 1/3*dy(i + 1) + 2/3*dy(i + 2);
        Bx(i, 4) = 1/6*dx(i + 1) + 4/6*dx(i + 2) + 1/6*dx(i + 3);
        By(i, 4) = 1/6*dy(i + 1) + 4/6*dy(i + 2) + 1/6*dy(i + 3);
    end
end

% nn is the subdivision level
% fprintf('numpt = %d \n', numpt)
figure;
B = zeros(dim_data,4);
plot(dx,dy,'ob-');   % plots d's as red circles
hold on;
for i = 1:N-2
    B(1,:) = Bx(i,:); B(2,:) = By(i,:);
    drawbezier_dc(B,nn,drawb);
end
hold off;
end

