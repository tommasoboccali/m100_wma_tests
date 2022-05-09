### GLOBAL Pool

```
#!/bin/bash

OUTDIR=<YOUR PATH TO WRAPPER>/wrappers
BIN=<YOUR PATH TO BIN>/manual_glidein_startup

$BIN --wms-collector="vocms0207.cern.ch" --client-name="CMSG-v1_0.main-vacuum" --req-name="CMSHTPC_T1_IT_CNAF_CINECA_Marconi100@gfactory_instance@CERN-Prod" --cmd-out-file="$OUTDIR/prod_glideinwrapper_marconi10
0" --glidein-startup="./glidein_startup.sh" --override-args="-dir TMPDIR -param_GLIDEIN_Singularity_Use OPTIONAL -param_GLIDEIN_REQUIRED_OS rhel7 -param_CONDOR_ARCH ppc64le -param_CONDOR_VERSION 9.dot,8.dot,0"
```


### ITB 

```
#!/bin/bash

OUTDIR=<YOUR PATH TO WRAPPER>/wrappers
BIN=<YOUR PATH TO BIN>/manual_glidein_startup

$BIN --wms-collector="vocms0205.cern.ch" --client-name="CMSG-ITB_gWMSFrontend-v1_0.main-vacuum" --req-name="CMSHTPC_T1_IT_CNAF_CINECA_Marconi100@gfactory_instance@CERN-ITB" --cmd-out-file="$OUTDIR/itb_glideinwr
apper_marconi100" --glidein-startup="./glidein_startup.sh" --override-args="-dir TMPDIR -param_GLIDEIN_Singularity_Use OPTIONAL -param_GLIDEIN_REQUIRED_OS rhel7 -param_CONDOR_ARCH ppc64le -param_CONDOR_VERSION
9.dot,8.dot,0"
```

questi generano il wrapper (una copia già pronta all'uso è disponibile in questo repo) che va lanciato per avviare il pilot, i.e: 

``` ./glidein_startup_wrapper``

questo utilizza l'eseguibile 

``` glidein_startup.sh ``` che è mantenuto da SI

Per quanto riguarda il token va messo in un file che ha come suffisso `idtoken` ( globalpool_idtoken ) 

## Ricetta CPU + GPU 



