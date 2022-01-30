.macpack apple2

.export ASoftProg
.export ASoftEnd

ASoftProg:
scrcode "10 FOR I=1 TO 10",$0D
scrcode "20 ? TAB(I);",'"',"HELLO",'"',$0D
scrcode "30 NEXT",$0D
;scrcode "40 GOTO 10",$0D
scrcode "RUN",$0D

ASoftEnd: