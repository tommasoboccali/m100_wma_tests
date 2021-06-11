# assume to be filled by the jupyterhub
IP=the_ip_to_call_back
TOKEN=the_token_tobe_used
USERIAM=user_name_from_iam

#decide
use_tsocks=1
tsocks_ssh_cmd="ssh -N -D 1087 -o TCPKeepAlive=yes -o ServerAliveInterval=60 boccali@lxplus.cern.ch"

#various
jup_exec=jypyterhub-standalone
root_dir=$WORK/jupRoot

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


module load anaconda
conda activate testJH

mkdir -p $root_dir
cd $root_dir
mkdir -p $USERIAM
cd $USERIAM

export JUPYTERHUB_API_TOKEN=${TOKEN}
export JUPYTERHUB_SERVICE_URL=${IP}

$jup_exe

exit $?

