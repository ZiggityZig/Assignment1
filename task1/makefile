task1.out: task1.s
	nasm -f elf32 task1.s -o task1.o
	gcc -m32 -g -Wall task1.c task1.o -o task1.out
	rm -f task1.o


.PHONY: clean

clean:
	rm -f task1.out