tb NAME:
  nvc -a ciapek/tb/{{NAME}}_tb.vhd ciapek/src/{{NAME}}.vhd -e {{NAME}}_tb  -r --wave --dump-arrays

wave NAME:
  gtkwave ciapek/tb/{{NAME}}.fst
