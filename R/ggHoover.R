#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Key Bernie
#'
#' @param data,params,size key stuff
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


draw_key_hoover <-  function(data, params, size) {

  filename <- system.file(paste0(data$Hoover, ".png"), package = "ggHoover", mustWork = TRUE)
  # print(filename)
  img <- as.raster(png::readPNG(filename))
  aspect <- dim(img)[1]/dim(img)[2]
  # rasterGrob
  grid::rasterGrob(image         = img)
}


# bernieGrob

HooverGrob <- function(x, y, size, Hoover = "anyone", geom_key = list(anyone="anyone.png",
                                                                      accenture="accenture_logo.png",
                                                                      bam="bam.png",
                                                                      ferris= "ferris.png",
                                                                      fighting_gator="Gator.png",
                                                                      gator= "go_gator.png",
                                                                      Hoover= "Hoover.png",
                                                                      statsquest= "statsquest.png",
                                                                      UF = "UF.png")) {

  filename <- system.file(geom_key[[unique(Hoover)]], package = "ggHoover", mustWork = TRUE)
  img <- as.raster(png::readPNG(filename))

  # rasterGrob
  grid::rasterGrob(x             = x,
                   y             = y,
                   image         = img,
                   # only set height so that the width scales proportionally and so that the icon
                   # stays the same size regardless of the dimensions of the plot
                   height        = size * ggplot2::unit(20, "mm"))
}

# GeomBernie
GeomHoover <- ggplot2::ggproto(`_class` = "GeomHoover",
                               `_inherit` = ggplot2::Geom,
                               required_aes = c("x", "y"),
                               non_missing_aes = c("size", "Hoover"),
                               default_aes = ggplot2::aes(size = 1, Hoover = "anyone", shape  = 19,
                                                          colour = "black",   fill   = NA,
                                                          alpha  = NA,
                                                          stroke =  0.5,
                                                          scale = 5,
                                                          image_filename = "anyone"),

                               draw_panel = function(data, panel_scales, coord, na.rm = FALSE) {
                                 coords <- coord$transform(data, panel_scales)
                                 ggplot2:::ggname(prefix = "geom_Hoover",
                                                  grob = HooverGrob(x = coords$x,
                                                                    y = coords$y,
                                                                    size = coords$size,
                                                                    Hoover = coords$Hoover))
                               },

                               draw_key = draw_key_hoover)

#' @title Bernie layer
#' @description The geom is used to add Bernie Sanders to plots. See ?ggplot2::geom_points for more info.
#' @inheritParams ggplot2::geom_point
#' @examples
#'
#'library(ggplot2)
#'
#' ggplot(mtcars) +
#'  geom_Hoover(aes(mpg, wt), Hoover = "bam") +
#'  theme_bw()
#'
#' ggplot(mtcars) +
#'  geom_Hoover(aes(mpg, wt), Hoover = "Hoover") +
#'  theme_bw()
#'
#' @importFrom grDevices as.raster
#' @export
geom_Hoover <- function(mapping = NULL,
                        data = NULL,
                        stat = "identity",
                        position = "identity",
                        ...,
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE) {

  ggplot2::layer(data = data,
                 mapping = mapping,
                 stat = stat,
                 geom = GeomHoover,
                 position = position,
                 show.legend = show.legend,
                 inherit.aes = inherit.aes,
                 params = list(na.rm = na.rm, ...))
}



