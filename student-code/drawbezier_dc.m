% function to draw a Bezier segment
% using de Casteljau subdivision
% nn = level of subdivision
% used by bspline4_dc
% also plots the Bezier control polygons if drawb = 1
%
function drawbezier_dc(B,nn,drawb)
 % nn is the subdivision level

 toPlot = B;
  
 for i = 1:nn
    toPlot = subdivstep(toPlot);
 end

 hold on;
 % Plot the curve segment as a random color
 if drawb == 1 
    plot(B(1,:), B(2,:), 'ro');
    plot(toPlot(1, :), toPlot(2, :), 'Color', [rand, rand, rand]);
 else
    %%% Plot the Bezier points as red + %%%
    plot(B(1,:), B(2,:), 'ro');
 end
 
 hold off;
 
end

