function [old_protos, prototipos, pertinencia] = kmedias(base, k, max_iter)

  [n, m] = size(base); % Dimens�es da base
  pertinencia = zeros(n, k); % Inicializa a matriz de pertinencia
  prototipos = base(randperm(n, k), :); % Inicializa prot�tipos aleatoriamente baseado em localizac�es dos objetos originais
  old_protos = prototipos; % Guarda prot�tipos iniciais

  for iter = 1:max_iter
    % Passo 1: Atualizar a matriz de pertinencia
    for i = 1:n
      % Inicializa a menor dist�ncia
      min_dist = Inf;
      min_idx = 0;

      % Calcula a dist�ncia entre o objeto e cada prot�tipo
      for j = 1:k
        dist = feval('dist_euclidiana', prototipos(j, :), base(i, :));
          if dist < min_dist
            min_dist = dist;
            min_idx = j;
          end
      end

      % Atualiza a matriz de pertinencia
      pertinencia(i, :) = 0; % Zera as pertinencias
      pertinencia(i, min_idx) = 1; % Define o prot�tipo mais pr�ximo
    end

    % Passo 2: Atualizar a posic�o dos prot�tipos
    for j = 1:k
      % Se o cluster j tiver membros, atualiza o prot�tipo como a m�dia
      if sum(pertinencia(:, j)) > 0
        prototipos(j, :) = mean(base(pertinencia(:, j) == 1, :), 1);
      end
    end
  end
end

