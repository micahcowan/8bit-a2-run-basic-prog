.macpack apple2

.import LoadAndRunBasic

;#link "load-and-run-basic.s"
;#link "basic-prog.s"
;#resource "run-basic-prog.cfg"
;#define CFGFILE run-basic-prog.cfg
;#resource "apple2.rom"
;#resource "basic-utils.inc"

.segment "STARTUP"

	jmp LoadAndRunBasic

