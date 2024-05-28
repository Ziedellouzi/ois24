set.seed(123)  # Pour la reproductibilité
data <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Définir des couleurs pour chaque catégorie
colors <- c("red", "green", "blue")
data$color <- colors[as.factor(data$category)]

# Création du graphique de dispersion
plot(data$x, data$y, col = data$color, pch = 19,
     main = "Scatter plot with linear regression line",
     xlab = "X-axis", ylab = "Y-axis")

# Ajouter une ligne de régression
model <- lm(y ~ x, data = data)
abline(model, col = "black", lwd = 2, lty = 2)

# Ajouter des annotations
text(data$x, data$y, labels = data$category, pos = 4, cex = 0.7, col = "black")

# Ajouter une légende
legend("topright", legend = levels(as.factor(data$category)),
       col = colors, pch = 19, title = "Category")