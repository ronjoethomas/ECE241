# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog lab5part1.v

#load simulation using mux as the top level simulation module
vsim counter8bit
#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

force {SW[0]} 0 
force {SW[1]} 0

force {KEY[0]} 1

run 10ns

force {SW[0]} 1
force {SW[1]} 1

#set enable on and turn reset off

run 5 ns

#cycle through  clocks
force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns

force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns
force {KEY[0]} 0
run 5ns

force {KEY[0]} 1
run 5ns

