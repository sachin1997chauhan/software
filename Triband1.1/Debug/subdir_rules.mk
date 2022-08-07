################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
SPI_DATA.obj: ../SPI_DATA.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="SPI_DATA.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

ad9361.obj: ../ad9361.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="ad9361.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

ad9361_api.obj: ../ad9361_api.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="ad9361_api.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

alc_power.obj: ../alc_power.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="alc_power.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

get_set_9361.obj: ../get_set_9361.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="get_set_9361.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.obj: ../main.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="main.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

peripheral.obj: ../peripheral.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="peripheral.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

spi_flash.obj: ../spi_flash.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="spi_flash.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

startup_ccs.obj: ../startup_ccs.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="startup_ccs.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

storing_reading_data.obj: ../storing_reading_data.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="storing_reading_data.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

usb_keyb_structs.obj: ../usb_keyb_structs.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="usb_keyb_structs.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

usbdhid.obj: ../usbdhid.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="usbdhid.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

user_interface_recieve.obj: ../user_interface_recieve.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="user_interface_recieve.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

util.obj: ../util.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me -Ooff --fp_mode=relaxed --include_path="C:/ti/ccsv6/tools/compiler/ti-cgt-arm_18.1.4.LTS/include" --include_path="c:/ti/TivaWare_C_Series-2.1.4.178" --include_path="SW_ROOT/examples/boards/ek-tm4c1294xl/usb_dev_keyboard" --include_path="SW_ROOT/examples" --advice:power="all" --define=ccs="ccs" --define=PART_TM4C1294NCPDT --define=TARGET_IS_TM4C129_RA0 --define=UART_BUFFERED -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=eabi --ual --preproc_with_compile --preproc_dependency="util.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


