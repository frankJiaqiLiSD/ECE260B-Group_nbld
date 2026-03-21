dc_shell -f run_dc.tcl | grep --color=always -iE '.*warn.*|.*error.*|$'
# Run this command directly, rather than calling this file, so that color will work. #