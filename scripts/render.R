# Rebuild the reports from the repository folder:
#   Rscript scripts/render.R                  # Markdown report and both PDFs
#   Rscript scripts/render.R --markdown-only  # Markdown report only (no LaTeX needed)
args <- commandArgs(trailingOnly = TRUE)
stopifnot(file.exists("analysis.Rmd"), file.exists("total.csv"))

required <- c("tidyverse", "sandwich", "lmtest", "rmarkdown")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) stop("Please install: ", paste(missing, collapse = ", "))

rmarkdown::render("analysis.Rmd", output_format = "github_document", envir = new.env())
if (!"--markdown-only" %in% args) {
  rmarkdown::render("analysis.Rmd", output_format = "pdf_document", envir = new.env())
  rmarkdown::render("summary.Rmd", output_format = "pdf_document", envir = new.env())
}
