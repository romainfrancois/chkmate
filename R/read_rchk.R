
#' Read rchk output diagnostics into a tibble
#'
#' @param file,... file and extract parameters to [readr::read_lines()]
#'
#' @return a tibble
#'
#' @importFrom readr read_lines
#' @importFrom stringr str_which str_replace
#' @importFrom utils tail
#' @importFrom rlang seq2
#' @importFrom tibble tibble
#' @importFrom tidyr unnest
#'
#' @export
read_rchk <- function(file, ...) {
  txt <- read_lines(file, ...)

  start <- tail(str_which(txt, "^* DONE"), 1L) + 2L
  end <- str_which(txt, "^Analyzed.*functions") - 1L

  rx <- "Analyzed ([[:digit:]]+) functions, traversed ([[:digit:]]+) states."
  nfunctions <- str_replace(txt[end + 1L], rx, "\\1")
  nstatses <- str_replace(txt[end + 1L], rx, "\\2")

  txt <- txt[start:end]

  start <- str_which(txt, "^Function")
  end   <- c(tail(start, -1L) - 1L, length(txt))

  fun <- str_replace(txt[start], "^Function ", "")

  lines <- map2(start, end, ~txt[seq2(.x + 1L, .y - 1L)])

  rx <- "^  \\[(.*?)\\] ([^/]*)(/[^:]*)?[:]?([[:digit:]]+)?"
  data <- map(lines, ~tibble(
      type = str_replace(.x, rx, "\\1"),
      description = str_replace(.x, rx, "\\2"),
      file = str_replace(.x, rx, "\\3"),
      line = str_replace(.x, rx, "\\4")
    )
  )

  unnest(tibble(fun = fun, data = data))
}
