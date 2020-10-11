function [lpoly2] = subdivstep(lpoly)
    t = 1/2;

    [~, m, l] = size(lpoly);
    
    lpoly2 = zeros(2, m, 2*l);
    
    for i = 1:l
        [ld, ud] = subdecas(lpoly(:, :, i), t);
        lpoly2(:, :, 2*i - 1) = ld;
        lpoly2(:, :, 2*i) = ud;
    end

end