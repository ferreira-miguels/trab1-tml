function [qualidades, particoes] = ensemble(dados, rotulos, num_clusters, tam_ensemble)

  particoes = {};

  for i = 1:tam_ensemble
      % Chama o kmeans
      [clusters, ~] = kmeans(dados, num_clusters, 'MaxIter', 50, 'Replicates', i);
      particoes{i} = clusters;

      % Avalia a qualidade de cada partição
      qualidades(i) = sum(clusters == rotulos) / length(dados);
  endfor

  disp("Qualidade de cada partição:");
  disp(qualidades);
endfunction
