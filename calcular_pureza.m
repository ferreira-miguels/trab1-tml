function [contingencia, pureza] = calcular_pureza(pertinencias, rotulos_verdadeiros, k)

  n = size(pertinencias, 1);

  contingencia = zeros(k, k);

  % Calcular a matriz de contingencia
  for i = 1:n
    % Encontrar a qual protótipo o objeto i pertence
    [~, cluster] = max(pertinencias(i, :));  % Encontra o cluster mais próximo (protótipo)

    % Encontrar a classe verdadeira do objeto i
    classe_real = rotulos_verdadeiros(i);

    % Incrementar a contagem na matriz de contingencia
    contingencia(cluster, classe_real) += 1;
  endfor

  soma_maximos_por_cluster = sum(max(contingencia, [], 2));
  pureza = soma_maximos_por_cluster / n;
endfunction

