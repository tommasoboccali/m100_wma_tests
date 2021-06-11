# assume to be filled by the jupyterhub
IP=the_ip_to_call_back
TOKEN=the_token_tobe_used

#decide
use_tsocks=1
tsocks_ssh_cmd="ssh -N -D 1087 -o TCPKeepAlive=yes -o ServerAliveInterval=60 boccali@lxplus.cern.ch"

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
export JUPYTERHUB_API_TOKEN=${TOKEN}
export JUPYTERHUB_SERVIE_URL=${IP}

