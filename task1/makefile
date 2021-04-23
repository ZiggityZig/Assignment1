task1.out: task1.s
	nasm -f elf32 task1.s -o task1.o
	gcc -m32 -g -Wall task1.c task1.o -o task1.out
	rm -f task1.o


.PHONY: clean

clean:
	rm -f task1.out


---

task1 : .o task2c.o util.o
	ld -m elf_i386 start.o task2c.o util.o -o flame2

start.o: start.s
	nasm -f elf32 start.s -o start.o

util.o: util.c
	gcc -m32 -Wall -ansi -c -nostdlib -fno-stack-protector util.c -o util.o

task2c.o: task2c.c
	gcc -m32 -Wall -ansi -c -nostdlib -fno-stack-protector task2c.c -o task2c.o

.PHONY: clean

clean:
	rm -f *.o flame2
	
