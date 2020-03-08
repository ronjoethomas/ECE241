# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog Lab2part2.v

#load simulation using mux as the top level simulation module
vsim ece244_2to1Mux

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# first test case
#Output 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
#run simulation for a few ns
run 10ns

#Output 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1

run 10ns

# Output 2
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0

run 10ns

#output 3
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
run 10ns

#output 4
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0

run 10ns

#output 5
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
run 10ns

#output 6
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
run 10ns

#output 7
force {SW[1]} 1
force {SW[1]} 1
force {SW[2]} 1
run 10ns
