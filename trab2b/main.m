% Projeto 2b - Topicos em Aprendizado de Maquina
% Aluno: Miguel Ferreira da Silva Neto
% Projeto de classificacao utilizando algoritmo kNN (versao da base de dados breast cancer)

printf("===== Programa de algoritmo classificador kNN =====\n");
base_carregada = false;
while(true)
  printf("\n### MENU ###\n");
  printf(" | 1. Carregar base de dados \n | 2. Executar o algoritmo kNN e plotar os resultados \n | 3. Terminar o programa\n");
  opt = input("Escolha uma opcao: ");
  switch opt
    case 1
      % Carrega e separa os dados
      base = load("base.m");
      dados = base(:, 3:end);
      classes = base(:, 2);

      % Dividir em 20% para teste e o resto (80%) para treino
      rand("seed", 42);
      n = size(dados, 1);
      indice = randperm(n);
      indice_treino = indice(1:round(0.8 * n));
      indice_teste = indice(round(0.8 * n) + 1:end);

      dados_treino = dados(indice_treino, :);
      classes_treino = classes(indice_treino);
      dados_teste = dados(indice_teste, :);
      classes_teste = classes(indice_teste);

      printf("Base de dados carregada!");
      base_carregada = true;

    case 2
      if base_carregada == true

        valores_k = [1, 3, 5];

        % Comecar o grafico
        figure;
        hold on;
        for k = valores_k
            % Executa kNN para o k atual
            [classes_pred, k_vizinhos] = knn(dados_teste, dados_treino, classes_treino, k);

            % Calcula a pontuacao
            pontos = zeros(size(dados_teste, 1), 1);
            for i = 1:size(dados_teste, 1)
                % Calcula a quantidade de vizinhos da classe 1
                classes_vizinhos = classes_treino(k_vizinhos{i, 1});
                pontos(i) = sum(classes_vizinhos == 1);
            endfor

            % Inicializando TPR e FPR
            tpr_val = [];
            fpr_val = [];
            limites = [0; unique(pontos)]; % Limite inicial

            for limite = limites'
              [TPR, FPR, mat_conf] = matriz_confusao(classes_teste, pontos, limite);

              % Armazena os valores de TPR e FPR
              tpr_val = [tpr_val; TPR];
              fpr_val = [fpr_val; FPR];
            endfor

              % Print
              printf("\nResultados para k = %d\n", k);
              disp("Matriz de Confusao:");
              disp(mat_conf);
              printf("TPR: %.2f, FPR: %.2f\n", TPR, FPR);

            % Plot da Curva ROC para o k atual
            plot(fpr_val, tpr_val, "-o", "DisplayName", sprintf("k=%d", k));
        endfor

        % Resto do grafico
        xlabel("FPR (False Positive Rate)");
        ylabel("TPR (True Positive Rate)");
        title("Curva ROC para diferentes valores de k");
        legend show;
        grid on;
        hold off;
      else
        printf("ERRO: Algoritmo kNN nao executado!\n");
      endif
    case 3
      printf("Terminando programa...");
      return;

  endswitch
endwhile









