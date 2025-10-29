function [num_class] = calcular_num_classes(labels)

  num_class = numel(unique(labels));

endfunction
