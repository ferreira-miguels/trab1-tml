## Esta é uma coletânea dos trabalhos realizados como forma de avaliação para a disciplina de Tópicos em Machine Learning.


<details>
<summary>Trabalho 1</summary>

### Trabalho 1 da disciplina de Tópicos em Machine Learning (Graduação)

  
Este trabalho consiste na aplicação do algoritmo K-Means (K-Médias) utilizando uma função de cálculo de distância euclidiana dada.

O trabalho foi implementado utilizando a interface gráfica do programa Octave, e foi escrito na linguagem do mesmo.

## Regras definidas pelo professor:

- Linguagem Octave
- Bases de dados: Ruspini (disponível no Moodle), Iris e Statlog(Heart)disponíveis em: https://archive.ics.uci.edu/ml/datasets.php
- Normalização linear da base de dados, no intervalo [0,1]
- Algoritmo de agrupamento de dados k-Médias
- Critério de parada: 10 iterações do algoritmo
- Distância Euclidiana como medida de dissimilaridade entre objetos
- Número de protótipos, inicializados aleatoriamente, igual ao número de classesna respectiva base de dados
- Pureza como medida de qualidade do agrupamento
- Para cada base de dados, executar o algoritmo 10 vezes e mostrar, em umatabela, média e desvio padrão da medida de pureza


</details>


<details>
<summary>Trabalho 2b </summary>

### Trabalho 2b da disciplina de Tópicos em Machine Learning (Graduação)

Este trabalho consiste na aplicação do algoritmo KNN (K-Nearest-Neighbors) utilizando uma função de cálculo de distância euclidiana dada. 
Também foi implementada a plotagem de uma matriz de confusão para avaliação dos resultados. 

O trabalho foi implementado utilizando a interface gráfica do programa Octave, e foi escrito na linguagem do mesmo.


## Regras definidas pelo professor:

Aplicar o algoritmo kNN à base de dados Breast Cancer Wisconsin (https://archive.ics.uci.edu/dataset/17/breast+cancer+wisconsin+diagnostic) para os seguintes valores de k: 1, 3, 5. Utilizar 20% da base de dados para teste e montar a matriz de confusão para cada valor de k.

Utilize as seguintes métricas de avaliação para as tabelas acima: TPR, FPR, e ACC. Obtenha a Curva ROC.

</details>


<details>
<summary>Trabalho 2b</summary>

### Trabalho 2b da disciplina de Tópicos em Machine Learning (Graduação)

Este trabalho consiste na aplicação do algoritmo KNN (K-Nearest-Neighbors) utilizando uma função de cálculo de distância euclidiana dada. 
Também foi implementada a plotagem de uma matriz de confusão para avaliação dos resultados. 

O trabalho foi implementado utilizando a interface gráfica do programa Octave, e foi escrito na linguagem do mesmo.


## Regras definidas pelo professor:

Aplicar o algoritmo kNN à base de dados Breast Cancer Wisconsin (https://archive.ics.uci.edu/dataset/17/breast+cancer+wisconsin+diagnostic) para os seguintes valores de k: 1, 3, 5. Utilizar 20% da base de dados para teste e montar a matriz de confusão para cada valor de k.

Utilize as seguintes métricas de avaliação para as tabelas acima: TPR, FPR, e ACC. Obtenha a Curva ROC.


</details>


<details>
<summary>Trabalho 3</summary>

### Trabalho 3 da disciplina de Tópicos em Machine Learning (Graduação)

Este trabalho consiste na aplicação da técnica de cluster ensemble (combinação de agrupamentos). Para o agrupamento foi utilizado o algoritmo K-Means (K-Médias).

O trabalho foi implementado utilizando a interface gráfica do programa Octave, e foi escrito na linguagem do mesmo.


## Regras definidas pelo professor:

### Construção do Ensemble

Produzir Diversidade de Soluções: escolher diferentes algoritmos de agrupamento ou diferentes valores paramétricos do mesmo algoritmo

-Gerar 1 ensemble com 10 partições (soluções)

-Avaliar a qualidade de cada partição (percentual de classificação correta)

-Pode utilizar algoritmos presentes no IDE sem necessidade de reimplementá-los

-Utilizar uma das bases de dados da literatura, site da UCI (https://archive.ics.uci.edu/datasets)


### Função de Consenso

Aplicar um algoritmo de agrupamento para o agrupamento de protótipos

-Avaliar a qualidade da partição consenso e compará-la com as partições do ensemble.

</details>
