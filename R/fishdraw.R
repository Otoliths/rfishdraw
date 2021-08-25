#' @title  Create and implement a custom JS library.
#' @description Procedurally generated fish drawings via ggplot2 based on fishdraw JavaScript library \url{https://github.com/LingDong-/fishdraw}.
#' @rdname custom_params
#' @param path Path for fishdraw.js
#' @param save save
#' @param body_curve_type \code{numeric} body_curve_type options:0 or 1.
#' @param body_curve_amount \code{numeric} body_curve_amount options:0.5,0.85 or 0.98.
#' @param body_length \code{numeric} body_length options:200,350 or 420.
#' @param body_height \code{numeric} body_height options:45,90 or 150.
#' @param scale_type \code{numeric} scale_type options:0,1,2 or 3.
#' @param scale_scale \code{numeric} scale_scale options:0.8,1 or 1.5.
#' @param pattern_type \code{numeric} pattern_type options:0,1,2,3 or 4.
#' @param pattern_scale \code{numeric} pattern_scale options:0.5,1 or 2.
#' @param dorsal_texture_type \code{numeric} dorsal_texture_type options:0 or 1.
#' @param dorsal_type \code{numeric} dorsal_type options:0 or 1.
#' @param dorsal_length \code{numeric} dorsal_length options:30,90 or 180.
#' @param dorsal_start \code{numeric} dorsal_start options:7,8,15;11,12,16.
#' @param dorsal_end \code{numeric} dorsal_end options:20,27,28;19,21,24.
#' @param wing_texture_type \code{numeric} wing_texture_type options:0 or 1.
#' @param wing_type \code{numeric} wing_type options:0 or 1.
#' @param wing_start \code{numeric} wing_start options:5,6 or 8.
#' @param wing_end \code{numeric} wing_end options:5,6 or 8.
#' @param wing_y \code{numeric} wing_y options:0.45,0.7 or 0.85.
#' @param wing_length \code{numeric} wing_length options:40,130,200;40,150,350.
#' @param wing_width \code{numeric} wing_width options:7,10,20;20,30,50.
#' @param pelvic_start \code{numeric} pelvic_start options:7,9,11;7,9,12.
#' @param pelvic_end \code{numeric} pelvic_end options:13,14,15
#' @param pelvic_length \code{numeric} pelvic_length options:0 or 1.
#' @param pelvic_type \code{numeric} pelvic_type options:0 or 1.
#' @param pelvic_texture_type \code{numeric} pelvic_texture_type options:0 or 1.
#' @param anal_start \code{numeric} anal_start options:16,19 or 23.
#' @param anal_end \code{numeric} anal_end options:25,29 or 31.
#' @param anal_length \code{numeric} anal_length options:20,50 or 80.
#' @param anal_type \code{numeric} anal_type options:0 or 1.
#' @param anal_texture_type \code{numeric} anal_texture_type options:0 or 1.
#' @param tail_type \code{numeric} tail_type options:0,1,2,3,4 or 5.
#' @param tail_length \code{numeric} tail_length options:50,75 or 180.
#' @param finlet_type \code{numeric} finlet_type options:0,1,2 or 3.
#' @param neck_type \code{numeric} neck_type options:0 or 1.
#' @param nose_height \code{numeric} nose_height options:-50,0 or 35.
#' @param mouth_size \code{numeric} mouth_size options:6,8 or 11.
#' @param head_length \code{numeric} head_length options:20,30 or 50.
#' @param head_texture_amount \code{numeric} head_texture_amount options:30,60 or 160.
#' @param has_moustache \code{numeric} has_moustache options:0,0,0,1.
#' @param moustache_length \code{numeric} moustache_length options:10,20,40.
#' @param has_beard \code{numeric} has_beard options:0,0,0,0,0,1.
#' @param has_teeth \code{numeric} has_teeth options:0,1,1.
#' @param teeth_length \code{numeric} teeth_length options:5,8 or 15.
#' @param teeth_space \code{numeric} teeth_space options:3,3.5 or 6.
#' @param beard_length \code{numeric} beard_length options:20,30 or 50.
#' @param eye_type \code{numeric} eye_type options:0 or 1.
#' @param eye_size \code{numeric} eye_size options:8,10 or 28.
#' @param jaw_size \code{numeric} jaw_size options:0.7,1 or 1.4.
#' @param jaw_open \code{numeric} jaw_open options:0 or 1.
#' @return Custom JS library.
#' @note Note that some fish species might not be representable with this system, and passing "bad" params might produce weird results or crash the program.
#' @author Liuyong Ding \email{ly_ding@126.com}
#' @examples
#' \dontrun{
#' # create and implement a custom JS library
#' custom_params(path = "./fishdraw.js",save = getwd())
#'
#'}
#' @export

custom_params <- function(path = "./fishdraw.js",save = getwd(),
                          body_curve_type = 0,body_curve_amount = 0.85,body_length = 420,body_height = 90,
                          scale_type = 1,scale_scale = 1,
                          pattern_type = 3,pattern_scale = 1,
                          dorsal_texture_type = 1,dorsal_type = 0,dorsal_length = 100,dorsal_start = 8,dorsal_end = 27,
                          wing_texture_type = 0, wing_type = 0,wing_start = 6,wing_end = 6,wing_y = 0.7,wing_length = 130,wing_width = 10,
                          pelvic_start = 9,pelvic_end = 14,pelvic_length = 85,pelvic_type = 0,pelvic_texture_type = 0,
                          anal_start = 19,anal_end = 29,anal_length = 50,anal_type = 0,anal_texture_type = 0,
                          tail_type = 0,tail_length = 75,finlet_type = 0,
                          neck_type = 0,nose_height = 0,
                          mouth_size = 8,
                          head_length = 30,head_texture_amount = 60,
                          has_moustache = 1,moustache_length = 10,
                          has_beard = 0,
                          has_teeth = 1,teeth_length = 8,teeth_space = 3.5,beard_length = 30,
                          eye_type = 0,eye_size = 10,
                          jaw_size = 1,jaw_open = 1)
{
  code <- paste(
    sprintf("const {main,fish,reframe,cleanup,draw_svg,str_to_seed} = require('%s');", path),
    sprintf("const fs = require('fs');"),
    sprintf("let my_params = {"),
    sprintf("body_curve_type:%s,", body_curve_type),
    sprintf("body_curve_amount:%s,", body_curve_amount),
    sprintf("body_length:%s,", body_length),
    sprintf("body_height:%s,", body_height),
    sprintf("scale_type:%s,", scale_type),
    sprintf("scale_scale:%s,", scale_scale),
    sprintf("pattern_type:%s,", pattern_type),
    sprintf("pattern_scale:%s,", pattern_scale),
    sprintf("dorsal_texture_type:%s,", dorsal_texture_type),
    sprintf("dorsal_type:%s,", dorsal_type),
    sprintf("dorsal_length:%s,", dorsal_length),
    sprintf("dorsal_start:%s,", dorsal_start),
    sprintf("dorsal_end:%s,", dorsal_end),
    sprintf("wing_texture_type:%s,", wing_texture_type),
    sprintf("wing_type:%s,", wing_type),
    sprintf("wing_start:%s,", wing_start),
    sprintf("wing_end:%s,", wing_end),
    sprintf("wing_y:%s,", wing_y),
    sprintf("wing_length:%s,", wing_length),
    sprintf("wing_width:%s,", wing_width),
    sprintf("pelvic_start:%s,", pelvic_start),
    sprintf("pelvic_end:%s,", pelvic_end),
    sprintf("pelvic_length:%s,", pelvic_length),
    sprintf("pelvic_type:%s,", pelvic_type),
    sprintf("pelvic_texture_type:%s,", pelvic_texture_type),
    sprintf("anal_start:%s,", anal_start),
    sprintf("anal_end:%s,", anal_end),
    sprintf("anal_length:%s,", anal_length),
    sprintf("anal_type:%s,", anal_type),
    sprintf("anal_texture_type:%s,", anal_texture_type),
    sprintf("tail_type:%s,", tail_type),
    sprintf("tail_length:%s,", tail_length),
    sprintf("finlet_type:%s,", finlet_type),
    sprintf("neck_type:%s,", neck_type),
    sprintf("nose_height:%s,", nose_height),
    sprintf("mouth_size:%s,", mouth_size),
    sprintf("head_length:%s,", head_length),
    sprintf("head_texture_amount:%s,", head_texture_amount),
    sprintf("has_moustache:%s,", has_moustache),
    sprintf("moustache_length:%s,", moustache_length),
    sprintf("has_beard:%s,", has_beard),
    sprintf("has_teeth:%s,", has_teeth),
    sprintf("teeth_length:%s,", teeth_length),
    sprintf("teeth_space:%s,", teeth_space),
    sprintf("beard_length:%s,", beard_length),
    sprintf("eye_type:%s,", eye_type),
    sprintf("eye_size:%s,", eye_size),
    sprintf("jaw_size:%s,", jaw_size),
    sprintf("jaw_open:%s,", jaw_open),
    sprintf("};"),
    sprintf("
let polylines = fish(my_params); \n
if (require.main === module) { \n
    let seed = undefined; \n
    let format = 'svg'; \n
    for (let i = 2; i < process.argv.length; i++){ \n
      let a = process.argv[i]; \n
      if (a == '--seed'){\n
        seed = process.argv[i+1];\n
      }else if (a == '--format'){\n
        format = process.argv[i+1];\n
      }\n
    }\n
    let polylines = main(seed);\n
    if (format == 'svg'){\n
      console.log(draw_svg(polylines));\n
    }else if (format == 'json'){\n
      console.log(JSON.stringify(polylines));\n
    }else if (format == 'smil'){\n
      console.log(draw_svg_anim(polylines));\n
    }else if (format == 'csv'){\n
      console.log(polylines.map(x=>x.flat().join(',')).join('\\n'));\n
    }\n
  }\n
          "),sep = "\n")
  writeLines(code, paste0(save,"/","customs.js"))
}
#' @title Get outputs polylines (supported format svg, json, csv, etc.)
#' @rdname get_polylines
#' @param path Path for fishdraw.js or customs.js via \code{\link{custom_params}}
#' @param name The name string is used as the name of the fish (printed in the drawing). If unspecified, a random pseudo-Latin name will be auto generated.
#' @param format Format options: svg (regular svg), smil (animated svg), csv (each polyline on a comma-separated line) and json.
#' @param output Outputs polylines (supported format svg, json, csv, etc.)
#' @param draw_type Draw_type options: random(by design fishdraw.js program is for randomly generated fishes),custom(by create and implement a custom customs.js for your favorite fish).
#' @examples
#' \dontrun{
#' # Get outputs polylines in svg
#' get_polylines(path = "inst/fishdraw.js",
#'               format = "svg",
#'               output = "output.svg",
#'               draw_type = "random")
#'
#' # Get outputs polylines in json
#' get_polylines(path = "inst/fishdraw.js",
#'               format = "json",
#'               output = "output.json",
#'               draw_type = "random")
#'
#' # Get outputs polylines in smil
#' get_polylines(path = "inst/fishdraw.js",
#'               format = "smil",
#'               output = "output.svg",
#'               draw_type = "random")
#'
#' # browse animated svg
#' browseURL("inst/animated.svg")
#'}
#' @export
get_polylines <- function(path = "./fishdraw.js",name = NULL,format = "svg",output = "output.svg",draw_type = "random"){
  switch(draw_type,
         random = {
           if(is.null(name)){
             code <- paste0("node ",path," --format ",format, " > ",output)
           }else{
             code <- paste0("node ",path," --seed ","'",name,"'"," --format ",format, " > ",output)
           }
           system(code)
         },
         custom = {
           if(is.null(name)){
             code <- paste0("node ",path," --format ",format, " > ",output)
           }else{
             code <- paste0("node ",path," --seed ","'",name,"'"," --format ",format, " > ",output)
           }
           system(code)
         }
  )
}
#' @title Procedurally generated fish drawings via ggplot2
#' @rdname fish_draw
#' @param data Path for *.json via \code{\link{get_polylines}}.
#' @param x see \code{\link{aes}} for details
#' @param y see \code{\link{aes}} for details
#' @param group see \code{\link{aes}} for details
#' @param ... see \code{\link{geom_path}} for details
#' @importFrom jsonlite fromJSON
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_path
#' @importFrom ggplot2 aes
#' @examples
#' \dontrun{
#' # fish drawings via plot
#' file <- system.file("extdata",package = "rfishdraw")
#' dat <- readRDS(paste0(file,"/","output_json.rds"))
#' for (i in seq(length(dat))) {
#' dat[[i]] <- cbind(dat[[i]],i)
#' }
#' plot(NA, xlim = c(0,520),ylim = c(-320,0),axes = F,xlab = " ",ylab = " ")
#' for(i in seq(length(dat))) {
#'   lines(x = dat[[i]][,1],y = -dat[[i]][,2], lwd=2, col = "blue")
#' }
#'
#' # fish drawings via ggplot2
#' fish_draw()
#'}
#' @export
fish_draw <- function(data = NULL, x = x,y = y,group = group,...){
  if (is.null(data)){

    data <- readRDS(paste0(system.file("extdata",package = "rfishdraw"),"/","output_json.rds"))
  }else{
    data <- jsonlite::fromJSON(data, flatten = TRUE)
    }
  for (i in seq(length(data))) {
    data[[i]] <- cbind(data[[i]],i)
  }
  data <- do.call(rbind,data)
  data <- data.frame(data)
  names(data) <- c("x","y","group")
  data$group <- factor(data$group)
  ggplot()+
    geom_path(data = data,aes(x = x,y = -y,group = group),...)
}
