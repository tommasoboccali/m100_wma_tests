- macchina con agent: vocms0263
- diventare cmst1: sudo -u cmst1 bash
- agentenv pare sistemare le cose
- poi vedo cose tipo

$manage start-agent
$manage db-prompt wmagent
$manage stop-agent
$manage start-agent
$manage stop-agent
$manage stop-services
$manage execute-agent wmagent-unregister-wmstats `hostname -f`
$manage execute-agent clean-oracle
$manage execute-agent wmcoreD --restart --component AgentStatusWatcher
$manage stop-services

$manage help
WMAgent with Rucio enabled: true
Documentation for this script can be found at: https://svnweb.cern.ch/trac/CMSDMWM/wiki/WMAgentManagement

ma quel link non esiste
