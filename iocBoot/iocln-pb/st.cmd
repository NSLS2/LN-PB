#!../../bin/linux-x86_64/ln-pb

#- You may have to change ln-pb to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "536870912")
epicsEnvSet("ENGINEER","jtagger x8060")
epicsEnvSet("LOCATION","RF BLDG/CAGE")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("EPICS_CAS_AUTO_BEACON_ADDR_LIST","NO")
epicsEnvSet("EPICS_CAS_BEACON_ADDR_LIST","10.0.153.255")
epicsEnvSet("EPICS_TZ", "EST5EDT,M3.2.0/2,M11.1.0/2")

## Register all support components
dbLoadDatabase "dbd/ln-pb.dbd"
ln_pb_registerRecordDeviceDriver(pdbbase) 

pwd
okls()

system("export LD_LIBRARY_PATH=$(EPICS_BASE)/lib/linux-x86_64:$(TOP)/lib/linux-x86_64:$LD_LIBRARY_PATH;$(TOP)/bin/linux-x86_64/okLoad_bitfile 1749000KJO llrf_xem7_LN_Test.bit")

createOKPort("rfport","1749000KJO")

## Load record instances
dbLoadRecords("db/okllrf.db", "PORT=rfport, S1=LN-RF, S2=RF, D1=CFC:PB, SD2=Cav, SD6=RAM, D3=Osc:1, TBL1=FF, TBL2=FB, BFN=$(TOP)/BITFLD.TXT")
dbLoadRecords("db/okSNo.db","S1=LN-RF,D1=CFC:PB")
dbLoadRecords("db/okllrf.db", "PORT=rfport, S1=LN-RF, S2=RF, D1=CFC:PB, SD2=Cav, SD6=RAM, D3=Osc:1, TBL1=FF, TBL2=FB")
dbLoadRecords("db/okSNo.db","S1=LN-RF,D1=CFC:PB")
dbLoadRecords("db/okWireIn.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, TBL2=FB")
dbLoadRecords("db/okWireInRB.db", "PORT=rfport, S1=LN-RF, S2=LRF, D1=CFC:PB, SD1=Tnr, D3=Osc:Mstr, TBL1=FF, TBL2=FB")
dbLoadRecords("db/okWireOut.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=Tnr, SD2=Cav, SD3=Fwd, SD4=Rfl, SD6=RAM, SD7=TS, TBL1=FF, TBL2=FB, RD=Xmtr")
dbLoadRecords("db/okTbl.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, D2=Cav, TBL=FF")
dbLoadRecords("db/okTbl.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, D2=Cav, TBL=FB")
dbLoadRecords("db/okTrigIn.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD6=RAM, SD7=TS")
dbLoadRecords("db/okTuner.db", "P=LN-RF{CFC:PB}, PORT=rfport")
#
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=Ref, ADDR=0")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=Cav, ADDR=1")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=Fwd, ADDR=2")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=Rfl, ADDR=3")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=Drv, ADDR=4")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=s1b, ADDR=5")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=s2b, ADDR=6")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD0=Ref, SD1=s3b, ADDR=7")
#
dbLoadRecords("db/okCircBuf.db", "PORT=rfport, S1=LN-RF, S2=LRF, D1=CFC:PB, D3=Osc:Mstr, SD0=Ref, SD6=RAM, TD1=Chan, ADDR=9, NELM1=0x04000000, NELM2=0x400000, NELM3=1024, L=R")
dbLoadRecords("db/okCircBufCh.db", "S1=LN-RF, D1=CFC:PB, SD6=RAM, TD1=Chan, NELM2=0x400000, NELM3=1024")
dbLoadRecords("db/okTS.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD7=TS")
dbLoadRecords("db/okmeasure.db", "S1=LN-RF, D1=CFC:PB, D2=Cav, SD2=Cav, TBL1=FF, TBL2=FB")

dbLoadRecords("db/okTS.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD7=TS")
dbLoadRecords("db/okTSEvent.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, SD7=TS")
dbLoadRecords("db/okCloseLoop.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, D2=Cav, TBL1=FF, TBL2=FB, SD6=RAM")
dbLoadRecords("db/okSmoothStep.db", "PORT=rfport, S1=LN-RF, D1=CFC:PB, D2=Cav,  TBL1=FF, TBL2=FB")
dbLoadRecords("db/iocAdminSoft.db", "IOC=RF-CT{$(IOC)}")
dbLoadRecords("db/reccaster.db", "P=RF-CT{${IOC}-RC}")
dbLoadRecords("db/asynRecord.db", "P=LN-RF{CFC:PB},R=port, PORT=rfport, ADDR=0, OMAX=40, IMAX=40")

#dbLoadRecords("db/RampMan-Ali.db")

#===========================================================================================================================================
# Auto save/restore
dbLoadRecords("db/save_restoreStatus.db", "P=RF-CT{$(IOC)}")
save_restoreSet_status_prefix("RF-CT{$(IOC)}")

# ensure directories exist
system("install -d ${TOP}/as")
system("install -d ${TOP}/as/req")
system("install -d ${TOP}/as/save")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("cfc_settings.sav")
set_pass0_restoreFile("cfc_values.sav")
set_pass1_restoreFile("cfc_values.sav")
set_pass1_restoreFile("cfc_waveforms.sav")

#asynSetTraceMask("rfport", -1, 0xff)
#asynSetTraceIOMask("rfport", -1, 0xff)
## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
# traceIocInit

#var aCalcArraySize 0x1B0000

asSetFilename("$(TOP)/DEFAULT.acf")
pwd

callbackSetQueueSize(20000)
cd "${TOP}/iocBoot/${IOC}"
iocInit()

dbl > records.dbl

system "cp records.dbl /cf-update/$HOSTNAME.$IOCNAME.dbl"

makeAutosaveFileFromDbInfo("${TOP}/as/req/cfc_settings.req", "autosaveFields_pass0")
makeAutosaveFileFromDbInfo("${TOP}/as/req/cfc_values.req", "autosaveFields")
makeAutosaveFileFromDbInfo("${TOP}/as/req/cfc_waveforms.req", "autosaveFields_pass1")

create_monitor_set("cfc_settings.req", 5 , "")
create_monitor_set("cfc_values.req", 5 , "")
create_monitor_set("cfc_waveforms.req", 5 , "")
caPutLogInit("10.0.152.133:7004",1)
date

