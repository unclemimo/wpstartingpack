if [  -d "wp-content-composer" ]; then
rsync -av wp-content-composer/wp-content/* wp-content/
rm -rf wp-content-composer
fi
