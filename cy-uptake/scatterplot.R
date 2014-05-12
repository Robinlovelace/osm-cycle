# scatter plot of pCycle01 and 11
ggplot(data = lam) + geom_point(aes(pCycle01 * 100, pCycle * 100))

# with log-log scale
ggplot(data = lam) + geom_point(aes(pCycle01 * 100, pCycle * 100, color = Region)) +
  geom_abline(slope = 1) +
  xlab("Proportion of commuter trips by bicycle 2001") +
  ylab("Proportion of commuter trips by bicycle 2011") +
  scale_x_log10() + scale_y_log10() + theme_classic() 
ggsave("figure/scatter-color.png")

# add labels
last_plot() + geom_text(aes(pCycle01 * 100, pCycle * 100, label = abbreviate(Label)))
