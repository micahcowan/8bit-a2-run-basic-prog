.macpack apple2

.import LoadAndRunBasic

;#link "load-and-run-basic.s"
;#link "basic-prog.s"
;#resource "run-basic-prog.cfg"
;#define CFGFILE run-basic-prog.cfg

.segment "STARTUP"

	jmp LoadAndRunBasic

