function plot_knn(test_object, data, labels, neighbors, valores_k)
    colors = ['r', 'g'];

    unique_labels = unique(labels); % Pega os rotulos unicos

    for j = 1:length(valores_k)
        k = valores_k(j);
        plot_neighbors = neighbors{1, j};

        % Cria uma nova figura pra cada k
        figure;
        hold on;

        % Plota todos os dados
        for i = 1:length(unique_labels)
            class_data = data(labels == unique_labels(i), :);
            if ~isempty(class_data)
                plot(class_data(:, 1), class_data(:, 2), 'o', 'MarkerSize', 8, 'MarkerEdgeColor', colors(i), 'MarkerFaceColor', colors(i));
            end
        end

        % Plota o objeto de teste com cor preta
        plot(test_object(1), test_object(2), 'kd', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

        % Verifica se tem vizinhos pra plotar
        if ~isempty(plot_neighbors)
            plot(plot_neighbors(:, 1), plot_neighbors(:, 2), 's', 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
            title(['k = ' num2str(k)]);
        end

        hold off;
    end
end

