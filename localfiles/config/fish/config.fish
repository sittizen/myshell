if status is-interactive
   bind \es beginning-of-line
   bind \ef end-of-line
   bind \eu backward-word
   bind \eo forward-word
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


# opencode
fish_add_path /home/simone.cittadini@gruppomol.lcl/.opencode/bin
