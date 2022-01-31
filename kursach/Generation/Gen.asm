.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "../Debug/GenLib.lib
ExitProcess PROTO:DWORD 
.stack 4096


 outdig PROTO : DWORD

 outline PROTO : DWORD

 concat PROTO : DWORD, : DWORD, : DWORD

 llength PROTO : DWORD, : DWORD

 todigit  PROTO : DWORD,  : DWORD

.const
		newline byte 13, 10, 0
		LTRL1 byte 'Resultat: ', 0
		LTRL2 sdword 128
		LTRL3 sdword 9
		LTRL4 byte 'Ostatok ot deleniya 128 na 9: ', 0
		LTRL5 sdword -9
		LTRL6 byte 'Hello ', 0
		LTRL7 byte 'World !!!', 0
		LTRL8 byte '89', 0
		LTRL9 byte 'Perevod so stroki v chislo: ', 0
		LTRL10 sdword 1
		LTRL11 byte 'Dlina stroki a:', 0
		LTRL12 sdword 4
		LTRL13 byte 'Sdvig vlevo: ', 0
		LTRL14 byte 'Bolshee mezhdu 15 i 9: ', 0
		LTRL15 sdword 15
		LTRL16 byte 'Cycle ot 1 do 4: ', 0
		LTRL17 sdword 5
		LTRL18 byte ' ', 0
		LTRL19 byte 'Ostatok ot deleniya 89 na 5: ', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		minres sdword 0
		funstr dword ?
		mainx sdword 0
		mainy sdword 0
		mainz sdword 0
		maina dword ?
		mainb dword ?
		mainc dword ?
		maine sdword 0
		maink sdword 0
		mainresult sdword 0
		maint sdword 0
		mainbol sdword 0
		mainab sdword 0
		mainh sdword 0
.code

;----------- min ------------
min PROC,
	minx : sdword, miny : sdword  
; --- save registers ---
push ebx
push edx
; ----------------------
mov edx, minx
cmp edx, miny

jg right1
jl wrong1
right1:
push minx

pop ebx
mov minres, ebx

jmp next1
wrong1:
push miny

pop ebx
mov minres, ebx

next1:
; --- restore registers ---
pop edx
pop ebx
; -------------------------
mov eax, minres
ret
min ENDP
;------------------------------


;----------- fun ------------
fun PROC,
	funa : dword, funb : dword  
; --- save registers ---
push ebx
push edx
; ----------------------

push funb
push funa
push offset buffer
call concat
mov funstr, eax
push offset newline
call outline


push offset LTRL1
call outline


push funstr
call outline

push offset newline
call outline

; --- restore registers ---
pop edx
pop ebx
; -------------------------
ret
fun ENDP
;------------------------------


;----------- MAIN ------------
main PROC
push LTRL2

pop ebx
mov mainx, ebx

push LTRL3

pop ebx
mov mainy, ebx

push mainx
push mainy
pop ebx
pop eax
cdq
mov edx,0
idiv ebx
push edx

pop ebx
mov mainx, ebx


push offset LTRL4
call outline


push mainx
call outdig

push offset newline
call outline

push LTRL5

pop ebx
mov mainz, ebx

mov maina, offset LTRL6
mov mainb, offset LTRL7
mov mainc, offset LTRL8

push offset LTRL9
call outline


push mainc
push offset buffer
call todigit
push eax

pop ebx
mov maine, ebx


push maine
call outdig

push offset newline
call outline


push maina
push offset buffer
call llength
push eax
push LTRL10
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov maink, ebx


push offset LTRL11
call outline


push maink
call outdig

push offset newline
call outline

push mainx
push LTRL10
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax
push LTRL12
pop ebx 
pop eax 
mov cl, bl 
shl eax, cl
push eax

pop ebx
mov mainresult, ebx


push offset LTRL13
call outline


push mainresult
call outdig

push offset newline
call outline


push offset LTRL14
call outline


push LTRL3
push LTRL15
call min
push eax

pop ebx
mov mainbol, ebx


push mainbol
call outdig

push offset newline
call outline

push LTRL10

pop ebx
mov mainab, ebx


push offset LTRL16
call outline

mov edx, mainab
cmp edx, LTRL17

jnz cycle2
jmp cyclenext2
cycle2:

push mainab
call outdig


push offset LTRL18
call outline

push mainab
push LTRL10
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov mainab, ebx

mov edx, mainab
cmp edx, LTRL17

jnz cycle2
cyclenext2:

push mainab
call outdig

push offset newline
call outline

push maine
push LTRL17
pop ebx
pop eax
cdq
mov edx,0
idiv ebx
push edx

pop ebx
mov mainh, ebx


push offset LTRL19
call outline


push mainh
call outdig

push offset newline
call outline


push mainb
push maina
call fun

push 0
call ExitProcess
main ENDP
end main
