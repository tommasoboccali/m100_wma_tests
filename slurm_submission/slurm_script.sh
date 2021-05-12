#!/bin/bash

# i cannot set the tsocks from here, I skip


export WORK_AREA=$WORK/glidein_work_area
mkdir -p $WORK_AREA

export IMAGE=/m100_work/INF21_lhc_0/IMAGES/cc7_ppc64le_gfal_0.3.sif

export SING_SCRIPT=$GLIDEINSCRIPTS/sing_script.sh

module load singularity

singularity run -B /cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security   -B /m100_work -B /cvmfs -B /m100_work/INF21_lhc_0/CMS/SITECONF:/marconi_work/Pra18_4658/cms/SITECONF $IMAGE $SING_SCRIPT


echo == SLURM SCRIPT finishing at `date` with code $?

exit 0
