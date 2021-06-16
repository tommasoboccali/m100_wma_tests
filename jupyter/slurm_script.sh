#!/bin/bash -i

# i cannot set the tsocks from here, I skip

echo == SLURM SCRIPT starting at `date`

export WORK_AREA=$WORK/jh_work_area
mkdir -p $WORK_AREA

module load anaconda

#CONDA_BASE=$(conda info --base)
eval $(conda shell.bash hook)
#conda init bash

conda activate testJH
echo $PATH

export tsocks_ssh_cmd="ssh -N -D 1087 -o TCPKeepAlive=yes -o ServerAliveInterval=60 boccali@lxplus.cern.ch" 

export use_tsocks=0


echo ===== STARTING JOB

if [ "$use_tsocks" == 1 ]
then
	echo ===== SETTING FOR SINGULARITY WITH  $tsocks_ssh_cmd
	$tsocks_ssh_cmd &
	echo ===== SLEEPING FOR 20 SEC
	sleep 20
	cd $WORK/tsocks-1.8beta5+ds1/
	export LD_PRELOAD=`pwd`/libtsocks.so
	cd -

fi

export JUPYTERHUB_API_TOKEN={thetoken}
export JUPYTERHUB_API_URL={theurl}
export USERNAME={username}

mkdir -p $USERNAME
cd $USERNAME
echo ===== Starting jupyterhub-singleuser with
echo === JUPYTERHUB_API_TOKEN=$JUPYTERHUB_API_TOKEN
echo === JUPYTERHUB_API_URL=$JUPYTERHUB_API_URL
echo === USERNAME=$USERNAME
echo === in the directory `pwd`
jupyterhub-singleuser


echo == SLURM SCRIPT finishing at `date` with code $?

exit 0
