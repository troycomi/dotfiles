function fish_prompt
    echo -n (set_color blue)(printf '%-11.10s' (basename $PWD))

    set_color -o

    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
