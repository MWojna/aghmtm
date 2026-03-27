LOAD_CONST R24, R25, DisplayRefreshPeriod
DealyLoop: rcall OneMsLoop
subi R24, 1
brne DealyLoop