function clear_latex
    for file in *.aux *.fdb_latexmk *.fls *.log *.synctex.gz *.xdv *.out
        if test -f $file
            rm $file
        end
    end
end
