function [clusters_consenso, qualidade_consenso] = consenso(dados, particoes, rotulos, num_clusters)
  % Cria uma matriz de ensemble (178 amostras x 10 parti��es)
  matriz_ensemble = cell2mat(particoes);

  % Fun��o de Consenso
  [clusters_consenso, ~] = kmeans(matriz_ensemble, num_clusters);

  % Avalia a parti��o de consenso
  if exist('rotulos', 'var')
      qualidade_consenso = sum(clusters_consenso == rotulos) / length(dados);
      disp("Qualidade da parti��o consenso:");
      disp(qualidade_consenso);
  endif

endfunction
