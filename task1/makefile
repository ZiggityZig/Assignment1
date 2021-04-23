task1.out: asm_task1Assignment1.s
	nasm -f elf32 asm_task1Assignment1.s -o task1.o
	gcc -m32 -g -Wall main_task1Assignment1.c task1.o -o task1.out
	rm -f task1.o


.PHONY: clean

clean:
	rm -f task1.out