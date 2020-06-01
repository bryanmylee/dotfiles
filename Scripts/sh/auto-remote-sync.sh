# $1: The remote to connect to. Can be user@host, or a configured alias.
DIR=$(dirs -c; dirs);
rsync -aP --delete . $1:$DIR;
fswatch -o . | while read f; do
    rsync -aP --delete . $1:$DIR;
done
