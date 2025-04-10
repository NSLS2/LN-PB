TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ln-pb
# ln-pb.dbd will be created and installed
DBD += ln-pb.dbd

# ln-pb.dbd will be made up from these files:
ln-pb_DBD += base.dbd

# Include dbd files from all support applications:
ln-pb_DBD += menuScan.dbd
ln-pb_DBD += system.dbd
ln-pb_DBD += asyn.dbd
ln-pb_DBD += calcSupport.dbd
ln-pb_DBD += okSupport.dbd
ln-pb_DBD += asSupport.dbd
ln-pb_DBD += devFileWaveform.dbd
ln-pb_DBD += devIocStats.dbd
ln-pb_DBD += okSNoASub.dbd
ln-pb_DBD += caPutLog.dbd
ln-pb_DBD += reccaster.dbd

USR_CPPFLAGS += -I$(OK)  -D_X86_64_ -DUNIX -DLINUX

# Add all the support libraries needed by this IOC
ln-pb_LIBS += llrfapp asyn autosave devIocStats calc sscan caPutLog seq pv reccaster pvDatabase qsrv pvaClient pvAccessIOC pvAccess pvAccessCA nt pvData

ln-pb_SYS_LIBS += okFrontPanel

USR_LDFLAGS += -L$(OK)

# ln-pb_registerRecordDeviceDriver.cpp derives from ln-pb.dbd
ln-pb_SRCS += ln-pb_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ln-pb_SRCS_DEFAULT += ln-pbMain.cpp
ln-pb_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ln-pb_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

LIBRARY_IOC += llrfapp

llrfapp_SRCS += okiface.cpp
llrfapp_SRCS += llrfPort.cpp
llrfapp_SRCS += calc.c
llrfapp_SRCS += devFileWaveform.c
llrfapp_SRCS += devFileWaveform0.c
llrfapp_SRCS += okSNoASub.c

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    llrfapp_LIBS += qsrv
    llrfapp_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    llrfapp_DBD += PVAServerRegister.dbd
    llrfapp_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
ln-pb_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

