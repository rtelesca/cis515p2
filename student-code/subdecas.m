function [ud, ld] = subdecas(cpoly, t)

    x = subdecas_helper(cpoly(1,:), t);
    y = subdecas_helper(cpoly(2,:), t);
    [~, l] = size(x);
    l = (l-1)/2+1;
    ud = zeros(2,l);
    ld = zeros(2,l);
    ud(1,:) = x(1:l);
    ud(2,:) = y(1:l);
    ld(1,:) = x(l:end);
    ld(2,:) = y(l:end);
end