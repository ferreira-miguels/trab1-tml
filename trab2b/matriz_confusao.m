function [TPR, FPR, conf_m] = matriz_confusao(classes, pontos, limite)
  predicoes = (pontos >= limite);

  % Calcular matriz de confusão
  TP = sum((predicoes == 1) & (classes == 1));
  TN = sum((predicoes == 0) & (classes == 0));
  FP = sum((predicoes == 1) & (classes == 0));
  FN = sum((predicoes == 0) & (classes == 1));

  conf_m(1, 1) = TP;
  conf_M(1, 2) = FP;
  conf_m(2, 1) = FN;
  conf_m(2, 2) = TN;

  % Calcular TPR e FPR
  TPR = TP / (TP + FN);
  FPR = FP / (FP + TN);

endfunction

