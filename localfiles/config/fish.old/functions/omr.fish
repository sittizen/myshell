function omr
    glab mr view $argv | xargs | rev | cut -d ' ' -f 4 | rev | xargs /opt/google/chrome/chrome
end
