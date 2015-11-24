library(ggplot2)
library(gcookbook)
presidents
str(presidents)
pres_rating <- data.frame(
  rating  = as.numeric(presidents),
  year    = as.numeric(floor(time(presidents))),
  quarter = as.numeric(cycle(presidents))
)
pres_rating

p <- ggplot(pres_rating, aes(x=year, y=quarter, fill=rating))
p + geom_tile()


p <- ggplot(pres_rating, aes(x=year, y=quarter, fill=rating))
p + geom_raster()


p + geom_tile() +
  scale_x_continuous(breaks = seq(1940, 1976, by = 4)) +
  scale_y_reverse() +
  scale_fill_gradient2(midpoint=50, mid="grey70", limits=c(0,100))

#recreate a data set
dat <- data.frame(person=factor(paste0("id#", 1:50), 
                                levels =rev(paste0("id#", 1:50))), matrix(sample(LETTERS[1:3], 150, T), ncol = 3))

library(ggplot2); library(reshape2)
dat3 <- melt(dat, id.var = 'person')
ggplot(dat3, aes(variable, person)) + geom_tile(aes(fill = value),
                                                colour = "white") + scale_fill_manual(values=c("red", "blue", "black"))