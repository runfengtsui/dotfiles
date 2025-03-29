function clear_latex
    for file in *.aux *.fdb_latexmk *.fls *.log *.synctex.gz *.xdv *.out *.toc *.bbl *.blg *.nav *.snm # '*.synctex(busy)'
        if test -f $file
            rm $file
        end
    end
end
