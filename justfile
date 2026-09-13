tb NAME:
  nvc -a ciapek/tb/{{NAME}}_tb.vhd ciapek/src/{{NAME}}.vhd -e {{NAME}}_tb  -r --wave --dump-arrays

wave NAME:
  gtkwave {{NAME}}_tb.fst

clean:
  rm -rf *.fst work ciapek/work ciapek/src/work ciapek/tb/work
