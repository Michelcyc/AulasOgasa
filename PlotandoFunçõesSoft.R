# Carregue o pacote ggplot2
library(ggplot2)

# Dados para formar um triângulo uniforme
# Usado para pré e pós detecção uniformes
dados <- data.frame(
  x = c(0, 1,   2, 3,   4, 5, 6),
  y = c(0, 0, 0.5, 1, 0.5, 0, 0)
)

# Dados para formar um triângulo com calda à esquerda
# Usado para pré-detecção descontada
# ou pós-detecção enfatizada
dados <- data.frame(
  x = c(0, 1, 2,   3,  4, 5, 6),
  y = c(0, 0.33, 0.66, 1,  0, 0, 0)
)

# Dados para formar um triângulo com calda à direita
# Usado para pós-detecção descontada
# ou pré-detecção enfatizada
dados <- data.frame(
  x = c(0, 1, 2,  3,    4,    5, 6),
  y = c(0, 0, 0,  1, 0.66, 0.33, 0)
)

# Dados para formar um trazézio equilibrado
dados <- data.frame(
  x = c(0, 1,   2, 3, 4, 5,   6, 7, 8),
  y = c(0, 0, 0.5, 1, 1, 1, 0.5, 0, 0)
)

# Dados para formar um trazézio de pré-detecção
dados <- data.frame(
  x = c(0, 1, 2, 3, 4, 5,   6, 7, 8),
  y = c(0, 0, 1, 1, 1, 0.66, 0.33, 0, 0)
)

# Dados para formar um trazézio de pós-detecção
dados <- data.frame(
  x = c(0, 1, 2, 3, 4, 5,   6, 7, 8),
  y = c(0, 0, 0.33, 0.66, 1, 1, 1, 0, 0)
)

# Dados para formar um quadrado equilibrado
dados <- data.frame(
  x = c(0, 1,   2, 3, 4, 5,   6, 7, 8),
  y = c(0, 0, 1, 1, 1, 1, 0, 0, 0)
)

# Dados para formar um quadrado de pré-detecção
dados <- data.frame(
  x = c(0, 1,   2, 3, 4, 5,   6, 7, 8),
  y = c(0, 0, 1, 1, 1, 1, 0, 0, 0)
)

# Dados para formar um quadrado de pós-detecção
dados <- data.frame(
  x = c(0, 1,   2, 3, 4, 5,   6, 7, 8),
  y = c(0, 0, 1, 1, 1, 1, 0, 0, 0)
)

# Dados para formar um pentagono convexo equilibrado
dados <- data.frame(
  x = c(0, 1, 2, 3, 4, 5, 6, 7, 8),
  y = c(0, 0, 1, 0.66, 0.33, 0.66, 1, 0, 0)
)


# Crie o gráfico de linha
ggplot(dados, aes(x = x, y = y)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Figura Fuzzy",
       x = "X",
       y = "Y")