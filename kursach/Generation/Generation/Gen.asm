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
		LTRL1 sdword 3
		LTRL2 sdword 113
		LTRL3 sdword 9
		LTRL4 byte 'Ostatok ot deleniya 113 na 9: ', 0
		LTRL5 sdword -9
		LTRL6 byte 'Hello ', 0
		LTRL7 byte 'World !!!', 0
		LTRL8 byte '89', 0
		LTRL9 byte 'Perevod so stroki v chislo: ', 0
		LTRL10 sdword 40
		LTRL11 sdword 1
		LTRL12 byte 'Dlina stroki a:', 0
		LTRL13 sdword 10
		LTRL14 sdword 2
		LTRL15 byte 'Sdvig vpravo: ', 0
		LTRL16 byte 'Bolshee mezhdu 15 i 9: ', 0
		LTRL17 sdword 15
		LTRL18 byte 'Cycle ot 1 do 4: ', 0
		LTRL19 sdword 4
		LTRL20 byte ' ', 0
		LTRL21 sdword 21
		LTRL22 byte 'Menshee mezhdy 15 i 21: ', 0
		LTRL23 sdword -2
		LTRL24 byte 'Resultat virazheniya: ', 0
		LTRL25 sdword 5
		LTRL26 byte 'Ostatok ot deleniya 89 na 5: ', 0
		LTRL27 byte 'Ploschad kruga R=9: ', 0
.data
		temp sdword ?
		buffer byte 256 dup(0)
		minres sdword 0
		maxres sdword 0
		squaresqu sdword 0
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
		mainhe sdword 0
		mainl sdword 0
		mainhz sdword 0
		maingr sdword 0
		mainh sdword 0
		mainsq sdword 0
		mainr sdword 0
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


;----------- max ------------
max PROC,
	maxx : sdword, maxy : sdword  
; --- save registers ---
push ebx
push edx
; ----------------------
mov edx, maxx
cmp edx, maxy

jl right2
jg wrong2
right2:
push maxx

pop ebx
mov maxres, ebx

jmp next2
wrong2:
push maxy

pop ebx
mov maxres, ebx

next2:
; --- restore registers ---
pop edx
pop ebx
; -------------------------
mov eax, maxres
ret
max ENDP
;------------------------------


;----------- square ------------
square PROC,
	squarex : sdword  
; --- save registers ---
push ebx
push edx
; ----------------------
push LTRL1
push squarex
pop ebx
pop eax
imul eax, ebx
push eax
push squarex
pop ebx
pop eax
imul eax, ebx
push eax

pop ebx
mov squaresqu, ebx

; --- restore registers ---
pop edx
pop ebx
; -------------------------
mov eax, squaresqu
ret
square ENDP
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

push offset newline
call outline

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

push LTRL1
push LTRL10
pop ebx
pop eax
sub eax, ebx
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
push LTRL11
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov maink, ebx


push offset LTRL12
call outline


push maink
call outdig

push offset newline
call outline

push LTRL13

pop ebx
mov mainx, ebx

push mainx
push LTRL14
pop ebx 
pop eax 
mov cl, bl 
shr eax, cl
push eax
push LTRL11
pop ebx 
pop eax 
mov cl, bl 
shr eax, cl
push eax

pop ebx
mov mainresult, ebx


push offset LTRL15
call outline


push mainresult
call outdig

push offset newline
call outline


push offset LTRL16
call outline


push LTRL3
push LTRL17
call min
push eax

pop ebx
mov mainbol, ebx


push mainbol
call outdig

push offset newline
call outline

push LTRL11

pop ebx
mov mainab, ebx


push offset LTRL18
call outline

mov edx, mainab
cmp edx, LTRL19

jnz cycle3
jmp cyclenext3
cycle3:

push mainab
call outdig


push offset LTRL20
call outline

push mainab
push LTRL11
pop ebx
pop eax
add eax, ebx
push eax

pop ebx
mov mainab, ebx

mov edx, mainab
cmp edx, LTRL19

jnz cycle3
cyclenext3:

push mainab
call outdig

push offset newline
call outline

push LTRL17

pop ebx
mov mainhe, ebx

push LTRL21

pop ebx
mov mainl, ebx


push offset LTRL22
call outline


push mainl
push mainhe
call max
push eax

pop ebx
mov mainhz, ebx


push mainhz
call outdig

push offset newline
call outline

push LTRL11

push mainl
push mainhe
call max
push eax
pop ebx
pop eax
add eax, ebx
push eax
push LTRL23
pop ebx
pop eax
imul eax, ebx
push eax

pop ebx
mov maingr, ebx


push offset LTRL24
call outline


push maingr
call outdig

push offset newline
call outline

push maine
push LTRL25
pop ebx
pop eax
cdq
mov edx,0
idiv ebx
push edx

pop ebx
mov mainh, ebx


push offset LTRL26
call outline


push mainh
call outdig

push offset newline
call outline

push LTRL3

pop ebx
mov mainr, ebx


push mainr
call square
push eax

pop ebx
mov mainsq, ebx


push offset LTRL27
call outline


push mainsq
call outdig


push mainb
push maina
call fun

push 0
call ExitProcess
main ENDP
end main
