function [result, t] = subdecas_helper(coords,t)
    [~,l] = size(coords);
    if l > 1
        div = coords(1:l-1)*t + coords(2:l)*(1-t);
        result = [coords(1), subdecas_helper(div, t),coords(l)];
    else
        result = coords;
    end
end

