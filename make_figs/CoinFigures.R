{
  set.seed(101)

  experiment.1 <-
    data.frame(
      Result = sort(sample(1:2, 100, T, prob = c(0.5, 0.5)))
    ) |>
    group_by(Result) |>
    mutate(
      Index = 0:(length(Result)-1),
      Column =   Index %% 5,
      Row = Index %/% 5
    )  |>
    mutate(
      x = Result + (Column - 2) / 8,
      y = 5*Row + 2.5
    )

  experiment.2 <-
    data.frame(
      Result = sort(sample(1:2, 100, T, prob = c(0.1, 0.9)))
    ) |>
    group_by(Result) |>
    mutate(
      Index = 0:(length(Result)-1),
      Column =   Index %% 5,
      Row = Index %/% 5
    )  |>
    mutate(
      x = Result + (Column - 2) / 8,
      y = 5*Row + 2.5
    )

  table(experiment.2$Result)
  pbinom(9, 100, 0.5)
}

{
  ggplot(.frm, aes(x=Face, y=Frequency, fill=Face)) +
    geom_bar(stat="identity") + ylim(c(0, 100)) +
    xlab("")
  ggsave("man/figures/NHST/HypotheticalCoin.png", width=6, height=4)
}

{
  ggplot(.frm, aes(x=Face, y=Frequency, fill=Face)) +
    geom_bar(stat="identity") + ylim(c(0, 100)) +
    xlab("") +
    annotate("point", x=experiment.1$x, y=experiment.1$y, size=5, color="#696969",
             alpha=0.9)
  ggsave("man/figures/NHST/FairCoin.png", width=6, height=4)

}


{
  ggplot(.frm, aes(x=Face, y=Frequency, fill=Face)) +
    geom_bar(stat="identity") + ylim(c(0, 100)) +
    xlab("") +
    annotate("point", x=experiment.2$x, y=experiment.2$y, size=5, color="#696969",
             alpha=0.9)
  ggsave("man/figures/NHST/BiasedCoin.png", width=6, height=4)

}
