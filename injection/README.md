ssh tboccali@lxplus.cern.ch
voms-proxy-init -voms cms
cd m100_wma_tests/injection/
cd /cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_11_1_0_pre1
cmsenv
cd -
python inject-test-wfs.py -u "https://cmsweb-testbed.cern.ch" -m DMWM -f TC_SLC7_Marconi.json -c TB_CMS_Marconi -r TB_CMS_Marconi -t testbed-vocms0263 -a DMWM_Test -p CMS_Marconi_TBv20210429_test -s "T3_IT_Opportunistic_dodas"

NOTA: giusto pare sia
python inject-test-wfs.py --debug -u "https://cmsweb-testbed.cern.ch" -m DMWM -f TC_SLC7_Marconi.json -c FF_CMS_Marconi -r TB_CMS_Marconi -t testbed-vocms0263 -a DMWM_Test -p CMS_Marconi_TBv20210430_test -s "T1_IT_CNAF"

altrimenti non becca il PNN .. stiamo studiando



per preparare area:
- prendere https://raw.githubusercontent.com/dmwm/WMCore/master/test/data/ReqMgr/inject-test-wfs.py
- create un json template e copiarlo in WMCore/test/data/ReqMgr/requests/DMWM/  (WMCore viene creata dal primo run del python sopra, che fallira') (o linkarlo)
- la parte che conta per l'architettura e' 

"ScramArch": [
            "slc7_ppc64le_gcc700"
        ],
        
        
- io ho un errore su "import future", che risolvo facendo cmsenv


links per monitoring:
- https://cmsweb-testbed.cern.ch/wmstats/index.html (metti Marconi nel primo campo per trovarli)
- roba tipo https://cmsweb-testbed.cern.ch/reqmgr2/fetch?rid=tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210430_091349_3205 per vedere il WF e i config



problema attuale: i classad, anceh se sottomesso con slc7_ppc64le .... contiene

Requirements = (TARGET.Arch == "X86_64") && (TARGET.OpSys == "LINUX") && (TARGET.Disk >= RequestDisk) && (TARGET.Memory >= RequestMemory) && (TARGET.Cpus >= RequestCpus) && (TARGET.HasFileTransfer)


