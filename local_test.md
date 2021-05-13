=== cd /m100_work/INF21_lhc_0/TESTS_WMA/m100_wma_tests/pilot/local_tests
=== ./condor_exec_cms.exe ./tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210503_094827_6245-Sandbox.tar.bz2  450

cosa ho dovuto fare

1) lanciare pilot e far atterrare job
2) cambiare condor_job_wrapper.sh; commentare linea sotto. questo va fatto prima che partano execute
3)     #exit_wrapper "Wrapper script $GWMS_THIS_SCRIPT failed: Unable to find GWMS_DIR" 1
4) c'e' da cambiare condor_exec.exe (quello del payload cms: dopo 
5)    source "$compPythonPath/py2-future/$PY_FUTURE_VERSION/$suffix"
6)    mettere
7)    pythonCommand=/usr/bin/python
  
  
