function [baseNorm] = normalizar(base)

  minBase = min(base);
  maxBase = max(base);

  baseNorm = (base-minBase)./(maxBase - minBase);

endfunction
