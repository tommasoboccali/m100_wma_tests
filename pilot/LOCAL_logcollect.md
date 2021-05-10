dentro un ambiente singularity con tsocks (vedere file \*tsocks al livello sopra)

cd /m100_work/INF21_lhc_0/test_wma

bash ./condor_exec.exe bash tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210507_162144_8756-Sandbox.tar.bz2 3344

si ottiene

======== WMAgent final job runtime checks STARTING at Mon May 10 07:53:33 GMT 2021 ========
Mon May 10 07:53:33 GMT 2021: Job Runtime in seconds:  4
Mon May 10 07:53:33 GMT 2021: Job bootstrap script exited:  152
Mon May 10 07:53:33 GMT 2021: Job execution exited:  152
Mon May 10 07:53:33 GMT 2021: Job runtime is less than 300 seconds. Sleeping  296


dovuto a 

INFO:root:    Invoking command: env X509_USER_PROXY=/m100_work/INF21_lhc_0/TESTS_WMA/m100_wma_tests/pilot/cert.pilot edmCopyUtil /store/unmerged/logs/prod/2021/5/7/tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210507_162144_8756/SinglePiE50HCAL_pythia8_2018_GenSimFull/SinglePiE50HCAL_pythia8_2018_GenSimFullMergeFEVTDEBUGoutput/0000/0/16b16de9-20d8-4871-add2-091165f62080-0-0-logArchive.tar.gz /m100_work/INF21_lhc_0/test_wma/job/WMTaskSpace/logCollect1
INFO:root:Subprocess stdout was:
[2021-05-10 09:53:32.271595 +0200][Error  ][XRootDTransport   ] [xs-303.cr.cnaf.infn.it:1094 #0.0] No protocols left to try
[2021-05-10 09:53:32.271647 +0200][Error  ][AsyncSock         ] [xs-303.cr.cnaf.infn.it:1094 #0.0] Socket error while handshaking: [FATAL] Auth failed
[2021-05-10 09:53:32.271693 +0200][Error  ][PostMaster        ] [xs-303.cr.cnaf.infn.it:1094 #0] elapsed = 0, pConnectionWindow = 31 seconds.
[2021-05-10 09:53:32.271705 +0200][Error  ][PostMaster        ] [xs-303.cr.cnaf.infn.it:1094 #0] Unable to recover: [FATAL] Auth failed.
[2021-05-10 09:53:32.271715 +0200][Error  ][XRootD            ] [xs-303.cr.cnaf.infn.it:1094] Impossible to send message kXR_query (code: kXR_Qconfig, arg length: 9). Trying to recover.
[2021-05-10 09:53:33.250447 +0200][Error  ][XRootD            ] [xs-303.cr.cnaf.infn.it:1094] Unable to send the message kXR_open (file: /store/unmerged/logs/prod/2021/5/7/tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210507_162144_8756/SinglePiE50HCAL_pythia8_2018_GenSimFull/SinglePiE50HCAL_pythia8_2018_GenSimFullMergeFEVTDEBUGoutput/0000/0/16b16de9-20d8-4871-add2-091165f62080-0-0-logArchive.tar.gz, mode: 0660, flags: kXR_open_read kXR_async kXR_retstat ): [FATAL] Auth failed
cms::Exception caught in EdmFileUtil
An exception of category 'FileOpenError' occurred while
   [0] Calling StorageFactory::open()
   [1] Calling XrdFile::open()
Exception Message:
Failed to open the file 'root://xs-303.cr.cnaf.infn.it:1094//store/unmerged/logs/prod/2021/5/7/tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210507_162144_8756/SinglePiE50HCAL_pythia8_2018_GenSimFull/SinglePiE50HCAL_pythia8_2018_GenSimFullMergeFEVTDEBUGoutput/0000/0/16b16de9-20d8-4871-add2-091165f62080-0-0-logArchive.tar.gz'
   Additional Info:
      [a] XrdCl::File::Open(name='root://xs-303.cr.cnaf.infn.it:1094//store/unmerged/logs/prod/2021/5/7/tboccali_TC_SLC7_Marconi_TB_CMS_Marconi_210507_162144_8756/SinglePiE50HCAL_pythia8_2018_GenSimFull/SinglePiE50HCAL_pythia8_2018_GenSimFullMergeFEVTDEBUGoutput/0000/0/16b16de9-20d8-4871-add2-091165f62080-0-0-logArchive.tar.gz', flags=0x10, permissions=0660) => error '[FATAL] Auth failed' (errno=0, code=204)
      [b] Remote server already encountered a fatal error; no redirections were performed.

