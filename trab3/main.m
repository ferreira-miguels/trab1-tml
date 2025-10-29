% Disciplina de T�picos em Aprendizagem de M�quina
% Docente: Miguel Ferreira da Silva Neto
% Discente: Prof. Alexandre Szabo
% Projeto 3 - Combina��o de Agrupamentos (Cluster Ensemble)

pkg load statistics;   % Carrega pacote que tem a fun��o do kmeans
base = load('wine.m');
dados_cru = base(:, 2:end);
rotulos = base(:, 1);

dados = normalizar(dados_cru);

num_clusters = 3;       % N�mero de r�tulos do dataset
tam_ensemble = 10;      % N�mero de parti��es

% Chama fun��o de ensemble
[qualidades, particoes] = ensemble(dados, rotulos, num_clusters, tam_ensemble);

% Chama fun��o de calcular consenso
[clusters_consenso, qualidade_consenso] = consenso(dados, particoes, rotulos, num_clusters);

% Printa os resultados do ensemble e do consenso
disp("Compara��o da qualidade das parti��es individuais com a parti��o consenso:");
for i = 1:tam_ensemble
    fprintf("Parti��o %d: %.2f%% | Consenso: %.2f%%\n", i, qualidades(i) * 100, qualidade_consenso * 100);
endfor

