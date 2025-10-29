% Trabalho de Agrupamento de Dados - Topicos em Aprendizagem de Maquina
% Aluno: Miguel Ferreira da Silva Neto
% OBS: Este script deve estar localizado em uma pasta com os outros scripts utilizados...
% O .zip com todos os scripts pode ser encontrado em: https://bit.ly/3TvaFEF

do
  printf('====== Programa de teste de algoritmo KMedias ======');
  printf('\nEtapa 1: Carregar base de dados: ');
  printf('\n 1. Carregar base de dados Ruspini \n 2. Carregar base de dados Iris \n 3. Carregar base de dados Statlog \n');
  op1 = input('Escreva uma opcao: ');

  switch op1
    % CARREGAR RUSPINI
    case 1
      base_rus = load('base_ruspini.m');
      classes_rus = load('rotulos_ruspini.m');
      num_classes_rus = feval('calcular_num_classes', classes_rus);
      printf('\nNumero de classes da base: %d\n', num_classes_rus);
      rus_title = 'Plot de objetos e prototipos da base Ruspini';
      printf('BASE DE DADOS RUSPINI CARREGADA COM SUCESSO!\n');

    % CARREGAR IRIS
    case 2
      base_iris = load('base_iris.m');
      classes_iris = load('rotulos_iris.m');
      num_classes_iris = feval('calcular_num_classes', classes_iris);
      printf('\nNumero de classes da base: %d\n', num_classes_iris);
      iris_title = 'Plot de objetos e prototipos da base Iris';
      printf('BASE DE DADOS IRIS CARREGADA COM SUCESSO!\n');

    % CARREGAR STATLOG
    case 3
      base_statlog = load('base_statlog.m');
      classes_statlog = load('rotulos_statlog.m');
      num_classes_statlog = feval('calcular_num_classes', classes_statlog);
      printf('\nNumero de classes da base: %d\n', num_classes_statlog);
      stat_title = 'Plot de objetos e prototipos da base Statlog';
      printf('BASE DE DADOS STATLOG CARREGADA COM SUCESSO!\n');
  endswitch

  printf('\nEtapa 2: Rodar algoritmo KMedias em uma das bases:');
  printf('\n 1. Rodar KMedias na base Ruspini \n 2. Rodar KMedias na base Iris \n 3. Rodar KMedias na base Statlog \n');
  op2 = input('Escreva uma opcao: ');

  switch op2
    % RODAR RUSPINI
    case 1
      if op1 == 1
        % Normalizando a base ruspini
        ruspini_base_norm = feval('normalizar', base_rus);

        printf('\nRodar KMedias uma vez ou 10 vezes?');
        printf('\n 1. Rodar uma vez \n 2. Rodar 10 vezes \n');
        opt = input('Escreva uma opcao: ');

        switch opt
          case 1
            % Chamando algoritmo kmeans na base ruspini normalizada com maximo de 10 iteracoes
            [old_protos_rus, prototipos_rus, pertinencia_rus] = feval('kmedias', ruspini_base_norm, num_classes_rus, 10)
            % Calculando a pureza da matriz de pertinencia gerada da base de dados iris
            [contingencia_rus, pureza_rus] = feval('calcular_pureza', pertinencia_rus, classes_rus, num_classes_rus)

          case 2
            printf('\nExecutando KMedias 10 vezes...\n');
            for i = 1:10
              % Chamando algoritmo kmeans na base ruspini normalizada com maximo de 10 iteracoes
              [old_protos_rus, prototipos_rus, pertinencia_rus] = feval('kmedias', ruspini_base_norm, num_classes_rus, 10);
              % Calculando a pureza da matriz de pertinencia gerada da base de dados iris
              [contingencia_rus, r_pureza(i)] = feval('calcular_pureza', pertinencia_rus, classes_rus, num_classes_rus);
            endfor
              %disp(r_pureza);
              media_pureza_r = mean(r_pureza);
              desvio_padrao_r = std(r_pureza);
              printf('\nMedia da pureza: %f\n', media_pureza_r);
              printf('Desvio padrao da pureza: %f\n', desvio_padrao_r);
        endswitch

      else
        printf('### ERRO: BASE DE DADOS RUSPINI NAO FOI CARREGADA.\n');
        printf('Terminando script...\n');
        break
      endif

    % RODAR IRIS
    case 2
      if op1 == 2
        % Normalizando a base iris
        iris_base_norm = feval('normalizar', base_iris);

        printf('\nRodar KMedias uma vez ou 10 vezes?');
        printf('\n 1. Rodar uma vez \n 2. Rodar 10 vezes \n');
        opt = input('Escreva uma opcao: ');

        switch opt
          case 1
            % Chamando algoritmo kmeans na base iris normalizada com maximo de 10 iteracoes
            [old_protos_iris, prototipos_iris, pertinencia_iris] = feval('kmedias', iris_base_norm, num_classes_iris, 10)
            % Calculando a pureza da matriz de pertinencia gerada da base de dados iris
            [contingencia_iris, pureza_iris] = feval('calcular_pureza', pertinencia_iris, classes_iris, num_classes_iris)

          case 2
            printf('\nExecutando KMedias 10 vezes...\n');
            for i = 1:10
              % Chamando algoritmo kmeans na base iris normalizada com maximo de 10 iteracoes
              [old_protos_iris, prototipos_iris, pertinencia_iris] = feval('kmedias', iris_base_norm, num_classes_iris, 10);
              % Calculando a pureza da matriz de pertinencia gerada da base de dados iris
              [contingencia_iris, i_pureza(i)] = feval('calcular_pureza', pertinencia_iris, classes_iris, num_classes_iris);
            endfor
              %disp(i_pureza);
              media_pureza_i = mean(i_pureza);
              desvio_padrao_i = std(i_pureza);
              printf('\nMedia da pureza: %f\n', media_pureza_i);
              printf('Desvio padrao da pureza: %f\n', desvio_padrao_i);
        endswitch

      else
        printf('### ERRO: BASE DE DADOS IRIS NAO FOI CARREGADA.\n');
        printf('Terminando script...\n');
        break
      endif

    % RODAR STATLOG
    case 3
      if op1 == 3
        % Normalizando a base statlog
        statlog_base_norm = feval('normalizar', base_statlog);

        printf('\nRodar KMedias uma vez ou 10 vezes?');
        printf('\n 1. Rodar uma vez \n 2. Rodar 10 vezes \n');
        opt = input('Escreva uma opcao: ');

        switch opt
          case 1
            % Chamando algoritmo kmeans na base statlog normalizada com maximo de 10 iteracoes
            [old_protos_statlog, prototipos_statlog, pertinencia_statlog] = feval('kmedias', statlog_base_norm, num_classes_statlog, 10)
            % Calculando a pureza da matriz de pertinencia gerada da base de dados statlog
            [contingencia_statlog, pureza_statlog] = feval('calcular_pureza', pertinencia_statlog, classes_statlog, num_classes_statlog)

          case 2
            printf('\nExecutando KMedias 10 vezes...\n');
            for i = 1:10
              % Chamando algoritmo kmeans na base statlog normalizada com maximo de 10 iteracoes
              [old_protos_statlog, prototipos_statlog, pertinencia_statlog] = feval('kmedias', statlog_base_norm, num_classes_statlog, 10);
              % Calculando a pureza da matriz de pertinencia gerada da base de dados statlog
              [contingencia_statlog, s_pureza(i)] = feval('calcular_pureza', pertinencia_statlog, classes_statlog, num_classes_statlog);
            endfor
              %disp(s_pureza);
              media_pureza_s = mean(s_pureza);
              desvio_padrao_s = std(s_pureza);
              printf('\nMedia da pureza: %f\n', media_pureza_s);
              printf('Desvio padrao da pureza: %f\n', desvio_padrao_s);
        endswitch

      else
        printf('### ERRO: BASE DE DADOS STATLOG NAO FOI CARREGADA.\n');
        printf('Terminando script...\n');
        break
      endif
  endswitch

    printf('\nPlotar base de dados e seus prototipos em um grafico: ');
    printf('\n(Caso tenha executado o algoritmo 10 vezes, o plot sera referente a ultima iteracao)');
    printf('\n 1. Plotar base de dados Ruspini\n 2. Plotar base de dados Iris\n 3. Plotar base de dados Statlog\n');
    op3 = input('Escolha uma opcao: ');

    switch op3
      % PLOTAR RUSPINI
      case 1
        if op1 == 1 % Se base ruspini foi carregada
          if op2 == 1 % Se KMedias foi rodado na ruspini
            % Chamando funcao de plot da base ruspini
            feval('plot_dados', ruspini_base_norm, prototipos_rus, old_protos_rus, pertinencia_rus, rus_title);
          else
            printf('### ERRO: KMÉDIAS NAO FOI RODADO NA BASE RUSPINI!\n');
            printf('Terminando script...\n');
            break
          endif
        else
          printf('### ERRO: BASE DE DADOS RUSPINI NAO FOI CARREGADA!\n');
          printf('Terminando script...\n');
          break
        endif
      % PLOTAR IRIS
      case 2
        if op1 == 2 % Se base iris foi carregada
          if op2 == 2 % Se KMedias foi rodado na iris
            % Chamando funcao de plot da base iris
            feval('plot_dados', iris_base_norm, prototipos_iris, old_protos_iris, pertinencia_iris, iris_title);
          else
            printf('### ERRO: KMEDIAS NAO FOI RODADO NA BASE IRIS!\n');
            printf('Terminando script...\n');
            break
          endif
        else
          printf('### ERRO: BASE DE DADOS IRIS NAO FOI CARREGADA!\n');
          printf('Terminando script...\n');
          break
        endif

      % PLOTAR STATLOG
      case 3
        if op1 == 3 % Se base statlog foi carregada
          if op2 == 3 % Se KMedias foi rodado na statlog
            % Chamando funcao de plot da base statlog
            feval('plot_dados', statlog_base_norm, prototipos_statlog, old_protos_statlog, pertinencia_statlog, stat_title);
          else
            printf('### ERRO: KMEDIAS NAO FOI RODADO NA BASE STATLOG!\n');
            printf('Terminando script...\n');
            break
          endif
        else
          printf('### ERRO: BASE DE DADOS STATLOG NAO FOI CARREGADA!\n');
          printf('Terminando script...\n');
          break
        endif
    endswitch

  printf('\nTerminar script? \n(0. Nao)\n(1. Sim)\n');
  x = input('Escolha uma opcao: ');
  printf('\n\n\n')
until (x == 1)
