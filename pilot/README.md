
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


