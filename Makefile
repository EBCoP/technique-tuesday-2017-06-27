all: copy-paste.Rmd iterative.Rmd recursion.Rmd functionals.Rmd
	Rscript -e 'rmarkdown::render("copy-paste.Rmd")'
	Rscript -e 'rmarkdown::render("iterative.Rmd")'
	Rscript -e 'rmarkdown::render("recursion.Rmd")'
	Rscript -e 'rmarkdown::render("functionals.Rmd")'
