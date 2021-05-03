
qui https://cmsdoc.cern.ch/~spiga/Marconi100/  ci sono due file.


questo https://cmsdoc.cern.ch/~spiga/Marconi100/glidein_startup_wrapper
è quello che dobbiamo lanciare sui nodi per fare i piloti manuali.

Lui è l'output di

https://cmsdoc.cern.ch/~spiga/Marconi100/manual_glidein_startup lanciato
coi seguenti inputs:

./manual_glidein_startup --wms-collector="vocms0205.cern.ch"
--client-name="CMSG-ITB_gWMSFrontend-v1_0.main"
--req-name="CMSHTPC_T3_IT_Opportunistc_DodasFake@gfactory_instance@CERN-ITB"
--cmd-out-file="glidein_startup_wrapper"
--glidein-startup="./glidein_startup.sh" --override-args="-dir TMPDIR
-param_GLIDEIN_Singularity_Use OPTIONAL -param_GLIDEIN_REQUIRED_OS rhel7
-param_CONDOR_ARCH ppc64le -param_CONDOR_VERSION 8.dot,8.dot,12"

Il primo lo usi sempre .. il secondo una tantum per generare il primo...
ai fini del test potrebbe anche non servire piu'. ma se qualcosa si
aggiorna sul Frontenend dobbiamo ri-eseguirlo.



### COME LANCIARE

SOLO UNA VOLTA

(
cd /m100_work/INF21_lhc_0/IMAGES
module load singularity
singularity pull --force docker://tommasoboccali/cc7_ppc64le_gfal:0.3
Dovrebbe creare il file cc7_ppc64le_gfal_0.3.sif
)

andare sul nodo batch
srun -v -p m100_usr_prod  -t 400  --gres=gpu:1  --cpus-per-task=16  --pty /bin/bash
cd /m100_work/INF21_lhc_0/IMAGES
module load singularity
singularity run -B /m100_work -B /cvmfs -B /m100_work/INF21_lhc_0/CMS/SITECONF:/marconi_work/Pra18_4658/cms/SITECONF cc7_ppc64le_gfal_0.3.sif bash

export X509_CERT_DIR=/cvmfs/grid.cern.ch/etc/grid-security/certificates/
export X509_VOMSES=/cvmfs/grid.cern.ch/etc/grid-security/vomses
export VOMS_USERCONF=/cvmfs/grid.cern.ch/etc/grid-security/vomses
cd /m100_work/INF21_lhc_0/TESTS_WMA/m100_wma_tests/pilot
export X509_USER_PROXY=/m100_work/INF21_lhc_0/TESTS_WMA/m100_wma_tests/pilot/cert.pilot

(NOTA DEVI METTERE /m100_work/INF21_lhc_0/TESTS_WMA/m100_wma_tests/pilot/cert.pilot copiando un proxy la lxplus  NOTA EVE ESSRE LUNGO!!! creato con 
voms-proxy-init -voms cms -valid 192:0
)


voms-proxy-info -all DEVE FUNZIONARE 

cioe'     ( 
Singularity> voms-proxy-info -all
subject   : /DC=ch/DC=cern/OU=Organic Units/OU=Users/CN=tboccali/CN=447815/CN=Tommaso Boccali/CN=837502432
issuer    : /DC=ch/DC=cern/OU=Organic Units/OU=Users/CN=tboccali/CN=447815/CN=Tommaso Boccali
identity  : /DC=ch/DC=cern/OU=Organic Units/OU=Users/CN=tboccali/CN=447815/CN=Tommaso Boccali
type      : RFC compliant proxy
strength  : 2048 bits
path      : /m100_work/INF21_lhc_0/TESTS_WMA/m100_wma_tests/pilot/cert.pilot
timeleft  : 11:42:36
key usage : Digital Signature, Key Encipherment
=== VO cms extension information ===
VO        : cms
subject   : /DC=ch/DC=cern/OU=Organic Units/OU=Users/CN=tboccali/CN=447815/CN=Tommaso Boccali
issuer    : /DC=ch/DC=cern/OU=computers/CN=voms2.cern.ch
attribute : /cms/Role=NULL/Capability=NULL
attribute : /cms/itcms/Role=NULL/Capability=NULL
timeleft  : 11:42:35
uri       : voms2.cern.ch:15002
)

chmod +x glidein_startup_wrapper
chmod +x glidein_startup.sh

./glidein_startup_wrapper
