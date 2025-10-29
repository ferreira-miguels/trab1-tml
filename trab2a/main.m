% Projeto 2 - Tópicos em Aprendizado de Máquina
% Aluno: Miguel Ferreira da Silva Neto
% Projeto de Classificação utilizando algoritmo kNN


printf(' Programa de algoritmo classificador kNN \n');
base_carregada = false;
knn_executado = false;
while (true)
  printf('\n##### MENU #####\n');
  printf('| 1. Carregar base de dados \n| 2. Executar o algoritmo kNN \n| 3. Plotar resultados de cada k\n| 4. Terminar o programa\n');
  opt = input('Escolha uma opcao: ');
  switch opt
    case 1
      load('sintetica.m');
      load('rotulos.m');
      load('objetos.m');

      printf('\nBase de dados carregada!\n');
      base_carregada = true;

    case 2
      if base_carregada == true
        % Definir os valores de k
        k = [1, 3, 5];

        % Executar o kNN
        [classes_pred, vizinhos] = knn(objetos, sintetica, rotulos, k);
        printf('\nAlgoritmo kNN executado!\n');
        classes_pred
        printf('k = 1; k = 3; k = 5\n');
        knn_executado = true;
      else
        printf('ERRO: Base de dados nao carregada!\n');
      endif

    case 3
      if base_carregada == true
        if knn_executado == true
          % Plota os resultados para o primeiro objeto de teste
          plot_knn(objetos(1, :), sintetica, rotulos, vizinhos, k);

        else
          printf('ERRO: Algoritmo kNN nao executado!\n');
        endif
      else
        printf('ERRO: Base de dados nao carregada!\n');
      endif

    case 4
      return;
  endswitch
endwhile






