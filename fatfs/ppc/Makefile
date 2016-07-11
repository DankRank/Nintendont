# FatFS Makefile for PowerPC (Nintendont loader)

#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------

.SUFFIXES:
#---------------------------------------------------------------------------------
ifeq ($(strip $(DEVKITPPC)),)
$(error "Please set DEVKITPPC in your environment. export DEVKITPPC=<path to>devkitPPC")
endif

include $(DEVKITPPC)/wii_rules

CFLAGS	:= -O3 -g -std=gnu89 -Wall $(MACHDEP) $(INCLUDE)
ARFLAGS	:= cru

MSUFFIX = -ppc
include ../makefile_common