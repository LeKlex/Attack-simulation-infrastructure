#/bin/bash

#################################################
# Starts all virtual machines in correct order
# Ing. Alexander Poschenreithner, 2017
#################################################


# Start logserver
(cd infrastructure/logserver && vagrant up)

# Start mainserver (will be attacked)
(cd infrastructure/server && vagrant up)