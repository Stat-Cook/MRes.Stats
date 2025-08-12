
{
  frm.1 <- data.frame(
    X = 80 + seq(-10, 20, 0.02),
    Hypothesis = "Null"
  ) |>
    mutate(
      P = dnorm(X, 80 + 0, 3)
    )

  frm.2  <- data.frame(
    X = 80 + seq(-10, 20, 0.02),
    Hypothesis = "Alternative"
  ) |>
    mutate(
      P = dnorm(X, 80 + 8, 3)
    )
}

{
  rbind(frm.1, frm.2) |>
    ggplot(aes(x=X, y=P, fill=Hypothesis)) +
    geom_area(alpha=0.4, position = 'identity')

  ggsave("man/figures/NHST/Power1.png",
         width = 6, height = 4, dpi = 300)

}


{
  overlap.x <- 80+c(3.5, 5.5, 4.5)
  overlap.y <- c(0.004, 0.004, 0.01)

  rbind(frm.1, frm.2) |>
    ggplot(aes(x=X, y=P, fill=Hypothesis)) +
    geom_area(alpha=0.4, position = 'identity') +
    annotate("point", x=overlap.x, y=overlap.y, size=5, color="#696969",
             alpha=0.9)

  ggsave("man/figures/NHST/Power2.png",
         width = 6, height = 4, dpi = 300)

}

{
  overlap.x <- 80+c(3.5, 5.5, 7.5, 9.5, 11.5, 13.5,  4.5, 6.5, 8.5, 10.5, 12.5)
  overlap.y <- c(rep(0.004, 6), rep(0.01,5))

  rbind(frm.1, frm.2) |>
    ggplot(aes(x=X, y=P, fill=Hypothesis)) +
    geom_area(alpha=0.4, position = 'identity') +
    annotate("point", x=overlap.x, y=overlap.y, size=5, color="#696969",
             alpha=0.9)

  ggsave("man/figures/NHST/Power3.png",
         width = 6, height = 4, dpi = 300)

}

