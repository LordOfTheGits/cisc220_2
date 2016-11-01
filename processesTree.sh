#!/bin/bash


function recur {

    cpid=${pids[$1]} #current pid
    cppid=${ppids[$1]} #current ppid

    #prints out the processes into the tree
    #echo "Name:" ${commands[$1]} "PID:" ${pids[$1]} "PPID:" ${ppids[$1]} "STARTED:" ${starts[$1]} "BY:" ${users[$1]}
    echo "Name:" $(basename ${commands[$1]}) "PID:" ${pids[$1]} "PPID:" ${ppids[$1]} "STARTED:" ${starts[$1]} "BY:" ${users[$1]}

    #for loop that will go through and check if the current process has any child processes
    for (( loc=1; loc<len; loc++ )) ; do

        #if it does have child processes
        if [[ $cpid==${ppids[$loc]} ]] ; then
            printf "|     |" #prints space to make tree
            recur $loc #and recursive call with info for the pid of current command to see if that one has child commands
        fi

    done

}


pids=($(ps axo pid))     #2
ppids=($(ps axo ppid))  #3
users=($(ps axo user))   #5    }order to be printed in tree
starts=($(ps axo start)) #4
commands=($(ps axo comm)) #1

#amount of processes running
len=${#pids[*]}
####this does't work becuase the code thinks it the # for length means a comment

#calling recur
var=1
recur var