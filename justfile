comp NAME:
  nvc -a ciapek/src/{{NAME}}.vhd

controller: 
  nvc -a ciapek/src/main_decoder.vhd
  nvc -a ciapek/src/ALU_decoder.vhd
  nvc -a ciapek/tb/controller_tb.vhd ciapek/src/controller.vhd -e controller_tb  -r --wave --dump-arrays
  

tb NAME:
  nvc -a ciapek/tb/{{NAME}}_tb.vhd ciapek/src/{{NAME}}.vhd -e {{NAME}}_tb  -r --wave --dump-arrays

wave NAME:
  gtkwave {{NAME}}_tb.fst

clean:
  rm -rf *.fst work ciapek/work ciapek/src/work ciapek/tb/work 
