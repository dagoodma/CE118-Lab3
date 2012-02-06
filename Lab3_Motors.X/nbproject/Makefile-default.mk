#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
SHELL=cmd.exe
# Adding MPLAB X bin directory to path
PATH:=C:/Program Files/Microchip/MPLABX/mplab_ide/mplab_ide/modules/../../bin/:$(PATH)
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/src/AD.o ${OBJECTDIR}/src/LED.o ${OBJECTDIR}/src/PORTS.o ${OBJECTDIR}/src/SES.o ${OBJECTDIR}/src/Stepper.o ${OBJECTDIR}/src/pwm.o ${OBJECTDIR}/src/serial.o ${OBJECTDIR}/src/timers.o

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/src/AD.o ${OBJECTDIR}/src/LED.o ${OBJECTDIR}/src/PORTS.o ${OBJECTDIR}/src/SES.o ${OBJECTDIR}/src/Stepper.o ${OBJECTDIR}/src/pwm.o ${OBJECTDIR}/src/serial.o ${OBJECTDIR}/src/timers.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH="C:\Program Files\Java\jre6/bin/"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC="C:\Program Files\Microchip\mplabc32\v2.01\bin\pic32-gcc.exe"
# MP_BC is not defined
MP_AS="C:\Program Files\Microchip\mplabc32\v2.01\bin\pic32-as.exe"
MP_LD="C:\Program Files\Microchip\mplabc32\v2.01\bin\pic32-ld.exe"
MP_AR="C:\Program Files\Microchip\mplabc32\v2.01\bin\pic32-ar.exe"
DEP_GEN=${MP_JAVA_PATH}java -jar "C:/Program Files/Microchip/MPLABX/mplab_ide/mplab_ide/modules/../../bin/extractobjectdependencies.jar" 
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps
MP_CC_DIR="C:\Program Files\Microchip\mplabc32\v2.01\bin"
# MP_BC_DIR is not defined
MP_AS_DIR="C:\Program Files\Microchip\mplabc32\v2.01\bin"
MP_LD_DIR="C:\Program Files\Microchip\mplabc32\v2.01\bin"
MP_AR_DIR="C:\Program Files\Microchip\mplabc32\v2.01\bin"
# MP_BC_DIR is not defined

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="linker/elf32pic32mx_v2_ds30_app.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/AD.o: src/AD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/AD.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/AD.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/AD.o.d" -o ${OBJECTDIR}/src/AD.o src/AD.c  
	
${OBJECTDIR}/src/pwm.o: src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/pwm.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/pwm.o.d" -o ${OBJECTDIR}/src/pwm.o src/pwm.c  
	
${OBJECTDIR}/src/timers.o: src/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/timers.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/timers.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/timers.o.d" -o ${OBJECTDIR}/src/timers.o src/timers.c  
	
${OBJECTDIR}/src/SES.o: src/SES.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/SES.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/SES.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/SES.o.d" -o ${OBJECTDIR}/src/SES.o src/SES.c  
	
${OBJECTDIR}/src/LED.o: src/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/LED.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/LED.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/LED.o.d" -o ${OBJECTDIR}/src/LED.o src/LED.c  
	
${OBJECTDIR}/src/serial.o: src/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/serial.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/serial.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/serial.o.d" -o ${OBJECTDIR}/src/serial.o src/serial.c  
	
${OBJECTDIR}/src/Stepper.o: src/Stepper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/Stepper.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/Stepper.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/Stepper.o.d" -o ${OBJECTDIR}/src/Stepper.o src/Stepper.c  
	
${OBJECTDIR}/src/PORTS.o: src/PORTS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/PORTS.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/PORTS.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/PORTS.o.d" -o ${OBJECTDIR}/src/PORTS.o src/PORTS.c  
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c  
	
else
${OBJECTDIR}/src/AD.o: src/AD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/AD.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/AD.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/AD.o.d" -o ${OBJECTDIR}/src/AD.o src/AD.c  
	
${OBJECTDIR}/src/pwm.o: src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/pwm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/pwm.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/pwm.o.d" -o ${OBJECTDIR}/src/pwm.o src/pwm.c  
	
${OBJECTDIR}/src/timers.o: src/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/timers.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/timers.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/timers.o.d" -o ${OBJECTDIR}/src/timers.o src/timers.c  
	
${OBJECTDIR}/src/SES.o: src/SES.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/SES.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/SES.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/SES.o.d" -o ${OBJECTDIR}/src/SES.o src/SES.c  
	
${OBJECTDIR}/src/LED.o: src/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/LED.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/LED.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/LED.o.d" -o ${OBJECTDIR}/src/LED.o src/LED.c  
	
${OBJECTDIR}/src/serial.o: src/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/serial.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/serial.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/serial.o.d" -o ${OBJECTDIR}/src/serial.o src/serial.c  
	
${OBJECTDIR}/src/Stepper.o: src/Stepper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/Stepper.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/Stepper.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/Stepper.o.d" -o ${OBJECTDIR}/src/Stepper.o src/Stepper.c  
	
${OBJECTDIR}/src/PORTS.o: src/PORTS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/PORTS.o.d 
	@${FIXDEPS} "${OBJECTDIR}/src/PORTS.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/src/PORTS.o.d" -o ${OBJECTDIR}/src/PORTS.o src/PORTS.c  
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"C:/Users/hahernan/Documents/CE118/Lab3/CE118-Lab3/Lab3_Motors.X/include" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf ${OBJECTFILES_QUOTED_IF_SPACED}        -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 
else
dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf ${OBJECTFILES_QUOTED_IF_SPACED}        -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Lab3_Motors.X.${IMAGE_TYPE}.elf  
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard $(addsuffix .d, ${OBJECTFILES}))
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
