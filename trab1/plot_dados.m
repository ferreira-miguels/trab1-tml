function [] = plot_dados(base, prototipos, protos_iniciais, pertinencia, titulo)
  figure(1);
  axis([0 1 0 1]);

  title(titulo);
  hold on;

  cores = ['r', 'g', 'b', 'c', 'm'];
  k = size(prototipos, 1); % Número de clusters

  % Plotar os protótipos iniciais como quadrados pretos
  plot(protos_iniciais(:,1), protos_iniciais(:,2), "ks", 'MarkerSize', 6, 'LineWidth', 2);
  hold on;

  % Plotar os objetos da base
  for i = 1:k
    % Encontra os objetos pertencentes ao cluster i
    objetos = pertinencia(:, i) == 1;

    % Plota os objetos deste cluster
    plot(base(objetos, 1), base(objetos, 2), strcat(cores(i), '*'), 'MarkerSize', 5);
    hold on;

    % Plota o protótipo final do cluster i como um círculo com a mesma cor dos seus membros
    plot(prototipos(i, 1), prototipos(i, 2), strcat(cores(i), 'o'), 'MarkerSize', 7, 'LineWidth', 2);
    hold on;
  endfor

  drawnow;
  hold off;
endfunction



