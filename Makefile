#---------------------------------------------------------------------------------
SUBPROJECTS := multidol kernel/asm resetstub fatfs/arm fatfs/ppc kernel loader/source/ppc codehandler
CLEANTARGETS := $(SUBPROJECTS:%=%.clean)
.PHONY: all build clean $(SUBPROJECTS) $(CLEANTARGETS)
#---------------------------------------------------------------------------------
all: loader

build:
	@$(MAKE) clean
	@$(MAKE) all
#---------------------------------------------------------------------------------
multidol:
	@echo " "
	@echo "Building Multi-DOL Loader"
	@echo " "
	@$(MAKE) -C multidol
kernel/asm:
	@echo " "
	@echo "Building asm files"
	@echo " $(windowsa)"
	@$(MAKE) -C kernel/asm
resetstub:
	@echo " "
	@echo "Building Reset Stub"
	@echo " "
	@$(MAKE) -C resetstub
fatfs/arm:
	@echo " "
	@echo "Building FatFS library for ARM"
	@echo " "
	@$(MAKE) -C fatfs/arm
fatfs/ppc:
	@echo " "
	@echo "Building FatFS library for PPC"
	@echo " "
	@$(MAKE) -C fatfs/ppc
codehandler:
	@echo " "
	@echo "Building Nintendont Codehandler"
	@echo " "
	@$(MAKE) -C codehandler
kernel: kernel/asm fatfs/arm codehandler
	@echo " "
	@echo "Building Nintendont Kernel"
	@echo " "
	@$(MAKE) -C kernel
loader/source/ppc:
	@echo " "
	@echo "Building Nintendont HID"
	@echo " "
	@$(MAKE) -C loader/source/ppc
loader: multidol resetstub fatfs/ppc kernel loader/source/ppc
	@echo " "
	@echo "Building Nintendont Loader"
	@echo " "
	@$(MAKE) -C loader
#---------------------------------------------------------------------------------
clean: $(CLEANTARGETS)
$(CLEANTARGETS):
	@$(MAKE) -s -C $(patsubst %.clean,%,$@) clean
#---------------------------------------------------------------------------------