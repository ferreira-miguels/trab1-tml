% Disciplina de Tópicos em Aprendizagem de Máquina
% Docente: Miguel Ferreira da Silva Neto
% Discente: Prof. Alexandre Szabo
% Projeto 3 - Combinação de Agrupamentos (Cluster Ensemble)

pkg load statistics;   % Carrega pacote que tem a função do kmeans
base = load('wine.m');
dados_cru = base(:, 2:end);
rotulos = base(:, 1);

dados = normalizar(dados_cru);

num_clusters = 3;       % Número de rótulos do dataset
tam_ensemble = 10;      % Número de partições

% Chama função de ensemble
[qualidades, particoes] = ensemble(dados, rotulos, num_clusters, tam_ensemble);

% Chama função de calcular consenso
[clusters_consenso, qualidade_consenso] = consenso(dados, particoes, rotulos, num_clusters);

% Printa os resultados do ensemble e do consenso
disp("Comparação da qualidade das partições individuais com a partição consenso:");
for i = 1:tam_ensemble
    fprintf("Partição %d: %.2f%% | Consenso: %.2f%%\n", i, qualidades(i) * 100, qualidade_consenso * 100);
endfor

