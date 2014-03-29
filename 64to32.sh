#!/bin/sh


SRC64="`tree -fiF src/ | grep "\.S$"`"

for file in $SRC64
do
OUTFILE="`echo \"$file\" | sed 's/^/lib32\//'`"

grep -e "r8" -e "r9" -e "r10" -e "r11" -e "r12" -e "r13" -e "r14" -e "r15" "$file" >/dev/null 2>&1
if [ "$?" != "0" ]
then
cat "$file" \
| sed 's/\[BITS 64\]/\[BITS 32\]/' \
| sed 's/rbp/ebp/g' \
| sed 's/rsp/esp/g' \
| sed 's/rdi/edi/g' \
| sed 's/rsi/esi/g' \
| sed 's/rax/eax/g' \
| sed 's/rbx/ebx/g' \
| sed 's/rcx/ecx/g' \
| sed 's/rdx/edx/g' \
> $OUTFILE
fi

done
