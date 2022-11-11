if [[ $(date +'%H') < 16 ]]; then 
    echo '%{T1}🧉'
else 
    echo '%{T1}🍺'
fi