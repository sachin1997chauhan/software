################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

CG_TOOL_ROOT := C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS

GEN_OPTS__FLAG := 
GEN_CMDS__FLAG := 

ORDERED_OBJS += \
"./SPI_DATA.obj" \
"./ad9361.obj" \
"./ad9361_api.obj" \
"./alc_power.obj" \
"./get_set_9361.obj" \
"./main.obj" \
"./peripheral.obj" \
"./spi_flash.obj" \
"./startup_ccs.obj" \
"./storing_reading_data.obj" \
"./usb_keyb_structs.obj" \
"./usbdhid.obj" \
"./user_interface_recieve.obj" \
"./util.obj" \
"./utils/uartstdio.obj" \
"./utils/usbdhandler.obj" \
"./utils/usbdhidkeyb.obj" \
"./drivers/pinout.obj" \
"../usb_dev_keyboard_ccs.cmd" \
$(GEN_CMDS__FLAG) \
-llibc.a \
-lc:/ti/TivaWare_C_Series-2.1.4.178/examples/boards/ek-tm4c1294xl/usb_dev_keyboard/ccs/../../../../../driverlib/ccs/Debug/driverlib.lib \
-lc:/ti/TivaWare_C_Series-2.1.4.178/examples/boards/ek-tm4c1294xl/usb_dev_keyboard/ccs/../../../../../usblib/ccs/Debug/usblib.lib \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include utils/subdir_vars.mk
-include drivers/subdir_vars.mk
-include subdir_rules.mk
-include utils/subdir_rules.mk
-include drivers/subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
Triband1.1.out \

EXE_OUTPUTS__QUOTED += \
"Triband1.1.out" \

BIN_OUTPUTS += \
Triband1.1.bin \

BIN_OUTPUTS__QUOTED += \
"Triband1.1.bin" \


# All Target
all: Triband1.1.out

# Tool invocations
Triband1.1.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM Linker'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual -z -m"usb_dev_keyboard_ccs.map" --heap_size=16384 --stack_size=16384 -i"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/lib" -i"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --reread_libs --diag_wrap=off --display_error_number --warn_sections --xml_link_info="Triband1.1_linkInfo.xml" --rom_model -o "Triband1.1.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '
	@$(MAKE) --no-print-directory post-build

Triband1.1.bin: $(EXE_OUTPUTS)
	@echo 'Invoking: ARM Hex Utility'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armhex"  -o "Triband1.1.bin" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $@'
	@echo ' '
	@$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(EXE_OUTPUTS__QUOTED)$(BIN_OUTPUTS__QUOTED)
	-$(RM) "SPI_DATA.pp" "ad9361.pp" "ad9361_api.pp" "alc_power.pp" "get_set_9361.pp" "main.pp" "peripheral.pp" "spi_flash.pp" "startup_ccs.pp" "storing_reading_data.pp" "usb_keyb_structs.pp" "usbdhid.pp" "user_interface_recieve.pp" "util.pp" "utils\uartstdio.pp" "utils\usbdhandler.pp" "utils\usbdhidkeyb.pp" "drivers\pinout.pp" 
	-$(RM) "SPI_DATA.obj" "ad9361.obj" "ad9361_api.obj" "alc_power.obj" "get_set_9361.obj" "main.obj" "peripheral.obj" "spi_flash.obj" "startup_ccs.obj" "storing_reading_data.obj" "usb_keyb_structs.obj" "usbdhid.obj" "user_interface_recieve.obj" "util.obj" "utils\uartstdio.obj" "utils\usbdhandler.obj" "utils\usbdhidkeyb.obj" "drivers\pinout.obj" 
	-@echo 'Finished clean'
	-@echo ' '

post-build:
	-"C:/ti/ccsv6/utils/tiobj2bin/tiobj2bin" "Triband1.1.out" "Triband1.1.bin" "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armofd" "C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armhex" "C:/ti/ccsv6/utils/tiobj2bin/mkhex4bin"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets

