#!/bin/bash

# i cannot set the tsocks from here, I skip

echo == SLURM SCRIPT starting at `date`

export WORK_AREA=$WORK/glidein_work_area
mkdir -p $WORK_AREA

export IMAGE=/m100_work/INF21_lhc_0/IMAGES/cc7_ppc64le_gfal_0.3.sif

export SING_SCRIPT=$GLIDEINSCRIPTS/sing_script.sh

module load singularity


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


if [ "$use_tsocks" == 1 ]
then
	LD_PRELOAD=$WORK/tsocks-1.8beta5+ds1/libtsocks.so singularity run -B /cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security   -B /m100_work -B /cvmfs -B /m100_work/INF21_lhc_0/CMS/SITECONF:/marconi_work/Pra18_4658/cms/SITECONF $IMAGE $SING_SCRIPT
else
	 singularity run -B /cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security   -B /m100_work -B /cvmfs -B /m100_work/INF21_lhc_0/CMS/SITECONF:/marconi_work/Pra18_4658/cms/SITECONF $IMAGE $SING_SCRIPT
fi


singularity run -B /cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security   -B /m100_work -B /cvmfs -B /m100_work/INF21_lhc_0/CMS/SITECONF:/marconi_work/Pra18_4658/cms/SITECONF $IMAGE $SING_SCRIPT


echo == SLURM SCRIPT finishing at `date` with code $?

exit 0
