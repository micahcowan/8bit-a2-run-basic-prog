.include "basic-utils.inc"

.export ASoftProg
.export ASoftEnd

ASoftProg:
line "FOR I=1 TO 10"
line "HTAB I"
lineP "HELLO"
line "FOR J=1 to 500:NEXT"
line "NEXT"
scrcode "RUN", $0D
ASoftEnd:
