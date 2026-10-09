# Canada's 2024 Surtax on Chinese Steel: Did Import Sources Shift?

On October 22, 2024, Canada imposed a 25% surtax on listed steel and aluminum products
from China. This project uses monthly Statistics Canada import data to ask whether
China's share of Canada's steel imports fell, and whether the fall can be attributed to
the surtax rather than to seasonality, prices, trends or the 2025 U.S.-Canada tariff
dispute.

- **One-page summary:** [summary.pdf](summary.pdf)
- **Full report:** [analysis.md](analysis.md) (readable on GitHub) or [analysis.pdf](analysis.pdf)

## Main findings

- China's share of Canada's chapter 72 steel imports fell from about 5.9% before the
  surtax to about 3.7% in the four months after it took effect. The decline was not
  seasonal and also appears in tonnes.
- A difference-in-differences comparison of products on and off the surtax list suggests
  that the decline occurred mainly in listed products. The estimated effect is a decline of
  about 2 percentage points, ranging from about 1 to 3 points depending on the model.
- The cleanest estimate uses only the four months before the U.S.-Canada tariff dispute.
  It is not statistically significant at the 5% level (p = 0.086), so the evidence is
  suggestive rather than conclusive.
- Japan's and South Korea's shares rose after the surtax, but both were already rising
  beforehand, so the data do not show clearly where China's lost share went.

## Methods

- Import shares by country, in value and in tonnes
- Seasonality check: the same winter months one year apart
- Time-series regression with calendar-month fixed effects, with and without a linear trend
- Bootstrap confidence interval and a ratio estimator
- Difference-in-differences: 130 six-digit products on the Department of Finance's surtax
  list vs. 37 products not on it, with month fixed effects

## Files

| File | Contents |
|---|---|
| `analysis.Rmd` | Full analysis (R Markdown) |
| `analysis.md`, `analysis_files/` | Full report rendered for GitHub, with figures |
| `analysis.pdf` | Full report as PDF (code hidden) |
| `summary.Rmd`, `summary.pdf` | One-page summary |
| `total.csv` | Canada's chapter 72 imports from the world |
| `china.csv`, `us.csv`, `korean_south.csv`, `japan.csv`, `vietnam.csv`, `taiwan.csv` | Canada's chapter 72 imports from each country |

## How to run

1. Install R (4.1 or later) and RStudio.
2. Install the packages:
   ```r
   install.packages(c("tidyverse", "rmarkdown", "tinytex"))
   tinytex::install_tinytex()   # only needed for PDF output
   ```
3. Download or clone this repository, and keep all files in the same folder.
4. Open `analysis.Rmd` in RStudio and click **Knit**. Choose `github_document` for the
   Markdown report or `pdf_document` for the PDF. Do the same for `summary.Rmd`.

## Data

Statistics Canada, Canadian International Merchandise Trade (CIMT) Web Application,
imports, HS chapter 72 (iron and steel) at the 6-digit level, monthly, January 2023 to
August 2026, values in Canadian dollars. Each country was downloaded separately, plus
"The world" for totals. The data are used under the
[Statistics Canada Open Licence](https://www.statcan.gc.ca/en/reference/licence).

- CIMT: https://www150.statcan.gc.ca/n1/pub/71-607-x/71-607-x2021004-eng.htm
- Surtax list: [Department of Finance Canada (2024), Final list of steel and aluminum products from China that will be subject to a 25 per cent surtax](https://www.canada.ca/en/department-finance/news/2024/10/final-list-of-steel-and-aluminum-products-from-china-that-will-be-subject-to-a-25-per-cent-surtax.html)

## Author

Xiang Zheng, University of Toronto (Economics major; Statistics and Mathematics minors)
