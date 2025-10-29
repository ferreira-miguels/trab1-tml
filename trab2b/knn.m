function [classes_pred, k_vizinhos] = knn(obj_teste, dados, rotulos, valores_k)
    % Inicializando as variaveis
    classes_pred = zeros(length(obj_teste), length(valores_k));
    k_vizinhos = cell(length(obj_teste), length(valores_k));

    num_dados = size(dados, 1);  % Numero de amostras na base de dados

    for i = 1:length(obj_teste)
        % Calcular a distancia euclidiana
        dist = calc_distancia(obj_teste(i, :), dados);

        % Ordenar as distancias e encontrar os indices dos vizinhos mais proximos
        [~, indices_ordenados] = sort(dist);

        for j = 1:length(valores_k)
            k = valores_k(j);

            % Ajusta k se for maior que o numero de pontos de dados
            k = min(k, num_dados);

            % Pegar os k vizinhos mais proximos e suas classes
            vizinhos = indices_ordenados(1:k);  % Certifique-se de que 'vizinhos' são inteiros
            k_vizinhos{i, j} = vizinhos;  % Armazena os índices inteiros dos k vizinhos

            % Pegar as classes dos k vizinhos
            vizinho_rotulos = rotulos(vizinhos);

            % Classifica o objeto de teste como a classe mais frequente entre os vizinhos
            classes_pred(i, j) = mode(vizinho_rotulos);
        endfor
    endfor
endfunction
