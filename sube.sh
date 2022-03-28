cat ../token | xclip -sel c
git add .
git commit -m "$(date)"
git push -u origin
