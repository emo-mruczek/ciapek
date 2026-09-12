tb NAME:
  nvc -a ciapek/src/{{NAME}}_tb.vhd ciapek/src/{{NAME}}.vhd -e {{NAME}}_tb  -r --wave --dump-arrays

wave NAME:
  gtkwave {{NAME}}.fst
