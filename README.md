[![CRAN Version](http://www.r-pkg.org/badges/version/rfishdraw)](https://cran.r-project.org/package=rfishdraw)
[![codecov](https://badge.fury.io/gh/Otoliths%2Frfishdraw.svg)](https://badge.fury.io/for/gh/Otoliths/rfishdraw)

<!-- r badge_devel("Otoliths/rfishdraw", "blue") -->
[![](https://cranlogs.r-pkg.org/badges/grand-total/rfishdraw?color=orange)](https://cran.r-project.org/package=rfishdraw)


# rfishdraw
Programmatically generated fish drawings via [ggplot2](https://github.com/tidyverse/ggplot2) based on [fishdraw Javascript](https://github.com/LingDong-/fishdraw) library. Note: You need to install [nodejs](https://nodejs.org/en/) before using the [rfishdraw](https://github.com/Otoliths/rfishdraw) package.


## :arrow_double_down: Installation

### Windows

Installing nodejs under windows from [nodejs](https://nodejs.org/en/). 

### MacOS

```
brew search node 
brew install node@14
brew link node@14
node --version
```

### Ubuntu

```
sudo apt-get install nodejs
```

### Installing rfishdraw

Install current official release:
```r
install.packages("rfishdraw")
```

Install development versions from GitHub with:
```r
library(devtools)
install_github("Otoliths/rfishdraw",build_vignettes = TRUE)
```
## :beginner: Example

##### Load the **rfishdraw** package
```r
library("rfishdraw")
```

##### Create and implement a custom JS library
```
custom_params(path = "./fishdraw.js",
  save = getwd(),
  body_curve_type = 0,
  body_curve_amount = 0.85,
  body_length = 420,
  body_height = 90,
  scale_type = 1,
  scale_scale = 1,
  pattern_type = 3,
  pattern_scale = 1,
  dorsal_texture_type = 1,
  dorsal_type = 0,
  dorsal_length = 100,
  dorsal_start = 8,
  dorsal_end = 27,
  wing_texture_type = 0,
  wing_type = 0,
  wing_start = 6,
  wing_end = 6,
  wing_y = 0.7,
  wing_length = 130,
  wing_width = 10,
  pelvic_start = 9,
  pelvic_end = 14,
  pelvic_length = 85,
  pelvic_type = 0,
  pelvic_texture_type = 0,
  anal_start = 19,
  anal_end = 29,
  anal_length = 50,
  anal_type = 0,
  anal_texture_type = 0,
  tail_type = 0,
  tail_length = 75,
  finlet_type = 0,
  neck_type = 0,
  nose_height = 0,
  mouth_size = 8,
  head_length = 30,
  head_texture_amount = 60,
  has_moustache = 1,
  moustache_length = 10,
  has_beard = 0,
  has_teeth = 1,
  teeth_length = 8,
  teeth_space = 3.5,
  beard_length = 30,
  eye_type = 0,
  eye_size = 10,
  jaw_size = 1,
  jaw_open = 1)
```


##### Get outputs polylines in svg
```
get_polylines(path = "inst/fishdraw.js",
              format = "smil",
              output = "animated.svg",
              draw_type = "random")
```
![](inst/animated.svg)

##### fish drawings via plot
```
file <- system.file("extdata",package = "rfishdraw")
dat <- readRDS(paste0(file,"/","output_json.rds"))
for (i in seq(length(dat))) {
dat[[i]] <- cbind(dat[[i]],i)
}
plot(NA, xlim = c(0,520),ylim = c(-320,0),axes = F,xlab = " ",ylab = " ")
for(i in seq(length(dat))) {
  lines(x = dat[[i]][,1],y = -dat[[i]][,2], lwd=2, col = "blue")
}
```
![](inst/plot.png)

##### fish drawings via ggplot2
```
fish_draw()

```
![](inst/single.png)

##### fish drawings via ggplot2
```
require(ggplot2)
p1 <- fish_draw() +
  theme_void()

library(patchwork)
p1+p1+p1+p1+p1+p1+plot_layout(ncol = 2)

```
![](inst/mult.png)


## :heart: Contribution

Contributions to this package are welcome. 
The preferred method of contribution is through a GitHub pull request. 
Feel also free to contact us by creating [**an issue**](https://github.com/Otoliths/rfishdraw/issues).
