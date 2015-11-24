library(RCircos)
data(RCircos.Histogram.Data)
head(RCircos.Histogram.Data)
data(RCircos.Heatmap.Data)
head(RCircos.Heatmap.Data)
data(RCircos.Link.Data)
head(RCircos.Link.Data)
data(UCSC.HG19.Human.CytoBandIdeogram);
head(UCSC.HG19.Human.CytoBandIdeogram);
data(UCSC.Mouse.GRCm38.CytoBandIdeogram);
head(UCSC.Mouse.GRCm38.CytoBandIdeogram);
data(UCSC.Baylor.3.4.Rat.cytoBandIdeogram);
head(UCSC.Baylor.3.4.Rat.cytoBandIdeogram);
chr.exclude <- NULL;

H<-UCSC.HG19.Human.CytoBandIdeogram


## setup 1
cyto.info <- UCSC.HG19.Human.CytoBandIdeogram;
tracks.inside <- 10;
tracks.outside <- 0;
RCircos.Set.Core.Components(cyto.info, chr.exclude, tracks.inside, tracks.outside);
rcircos.params <- RCircos.Get.Plot.Parameters();
rcircos.cyto <- RCircos.Get.Plot.Ideogram();
rcircos.position <- RCircos.Get.Plot.Positions();
RCircos.List.Parameters()
params <- RCircos.Get.Plot.Parameters();
params$radius.len <- 2.0;
params$base.per.unit <- 5000;

RCircos.Reset.Plot.Parameters(params)


## setup 2

rcircos.params <- RCircos.Get.Plot.Parameters();

rcircos.params$base.per.unit <- 30000;

RCircos.Reset.Plot.Parameters(rcircos.params);

RCircos.List.Parameters();

params <- RCircos.Get.Plot.Parameters();
params$radius.len <- 2.0;
params$base.per.unit <- 5000;
RCircos.Reset.Plot.Parameters(params)


#out.file <- "RCircosDemoHumanGenome.pdf";
#pdf(file=out.file, height=8, width=8, compress=TRUE);
RCircos.Set.Plot.Area();
par(mai=c(0.25, 0.25, 0.25, 0.25));
plot.new();
plot.window(c(-2.5,2.5), c(-2.5, 2.5));
RCircos.Chromosome.Ideogram.Plot();
data(RCircos.Gene.Label.Data);
name.col <- 4;
side <- "in";
track.num <- 1;
RCircos.Gene.Connector.Plot(RCircos.Gene.Label.Data, track.num, side);
track.num <- 2;
RCircos.Gene.Name.Plot(RCircos.Gene.Label.Data,name.col,track.num, side);

data(RCircos.Heatmap.Data);
data.col <- 6;
track.num <- 5;
side <- "in";
RCircos.Heatmap.Plot(RCircos.Heatmap.Data, data.col,track.num, side);


data(RCircos.Scatter.Data);
data.col <- 5;
track.num <- 6;
side <- "in";
by.fold <- 1;
RCircos.Scatter.Plot(RCircos.Scatter.Data, data.col, track.num, side, by.fold);










