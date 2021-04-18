task2.out: asm_task2Assignment1.s
	nasm -f elf32 asm_task2Assignment1.s -o task2.o
	gcc -m32 -g -Wall main_task2Assignment1.c task2.o -o task2.out

.PHONY: clean

clean:
	rm -f task2.o
	rm -f task2.out