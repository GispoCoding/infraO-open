docker run -it --rm -v "${pwd}/src:/app".ToLower() -v "${pwd}/out:/out".ToLower() mvaaltola/bookdown:latest bash -c "set -e \
rm -rf /out/* \
Rscript -e \`"bookdown::render_book('/app', 'bookdown::html_book')\`" \
mv _book/* /out/ && rm -r _book && chmod --recursive 777 /out"
