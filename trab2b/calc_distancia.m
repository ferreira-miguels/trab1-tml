function [d] = calc_distancia(proto, obj)

  d = sqrt(sum((obj - proto).^2, 2));

endfunction
