- macchina con agent: vocms0263
- diventare cmst1: sudo -u cmst1 bash
- agentenv pare sistemare le cose
- poi vedo cose tipo nella history

### /data/srv/wmagent/v1.4.5.patch2/install/wmagent/*/*Log$manage start-agent
### /data/srv/wmagent/v1.4.5.patch2/install/wmagent/*/*Log$manage db-prompt wmagent
### /data/srv/wmagent/v1.4.5.patch2/install/wmagent/*/*Log$manage stop-agent
### /data/srv/wmagent/v1.4.5.patch2/install/wmagent/*/*Log$manage start-agent
### $manage stop-agent
### $manage stop-services
### $manage execute-agent wmagent-unregister-wmstats `hostname -f`
### $manage execute-agent clean-oracle
### $manage execute-agent wmcoreD --restart --component AgentStatusWatcher
### $manage stop-services

### $manage help
WMAgent with Rucio enabled: true
Documentation for this script can be found at: https://svnweb.cern.ch/trac/CMSDMWM/wiki/WMAgentManagement

ma quel link non esiste. Direi che la tabella qui https://twiki.cern.ch/twiki/bin/view/CMSPublic/CompOpsWorkflowOperationsWMAgentToolkit abbia senso

in particolare

### $manage stop-agent
### $manage start-agent

sembrano fare la cosa giusta

importnte: tutti i printout che mettiamo facciamoli iniziare con TB_

print si puo' usare nell'inizializzazione
invece nel testo conviene fare logging.info("TB_ Setting poll interval to %s seconds", pollInterval)



camniatom

./wmagent/v1.4.5.patch2/sw/slc7_amd64_gcc630/cms/wmagent/1.4.5.patch2/etc/submit.sh

con un iff per ppc

- primo test: alla prima sottomissione con arch ppc federica ha ottenuto 

Message: Argument 'ScramArch' with value [u'slc7_ppc64le_gcc700'], doesn't pass the validate function.
It's definition is:
                     "ScramArch": {"validate": lambda x: all([y in architectures() for y in x]),
                                   "optional": False, "type": makeNonEmptyList},

- navigando vedo che questo architectures() viene da TagCollector() --> lib/python2.7/site-packages/WMCore/Services/TagCollector/TagCollector.py
- provo a farmele stampare alla creazione
-  per cercare tutte le cose che stampiamo, dovrebbe essere ok

### grep TB_ /data/srv/wmagent/v1.4.5.patch2/install/wmagent/*/*Log 
per esempio funziona con on logging.info("TB_ Setting poll interval to %s seconds", pollInterval) in JocCreator:

/data/srv/wmagent/v1.4.5.patch2/install/wmagent/JobCreator/ComponentLog:2021-04-29 16:18:12,787:140674610206528:INFO:JobCreator:TB_ Setting poll interval to 120 seconds



### come fermare / cancellare / editare jobs

- cambio ARCH
### condor_qedit  2765.10  Requirements '(TARGET.Arch == "ppc64le") && (TARGET.OpSys == "LINUX") && (TARGET.Disk >= RequestDisk) && (TARGET.Memory >= RequestMemory) && ((TARGET.FileSystemDomain == MY.FileSystemDomain) || (TARGET.HasFileTransfer))'
- ANCHE QUESTO FUNZIONA per tutti i jobs
### condor_qedit cmst1  Requirements '(TARGET.Arch == "ppc64le") && (TARGET.OpSys == "LINUX") && (TARGET.Disk >= RequestDisk) && (TARGET.Memory >= RequestMemory) && ((TARGET.FileSystemDomain == MY.FileSystemDomain) || (TARGET.HasFileTransfer))'
- sospendo tutto
### condor_suspend cmst1
- cancello tutto
### condorq | awk '{print $1}' | xargs condor_rm


