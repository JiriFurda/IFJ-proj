CFLAGS=-std=c99

all: compiler

compiler: main.o scanner.o str.o parser.o ilist.o symtab.o stack.o builtin.o expr.o tokstack.o
	gcc -Wall -Wextra main.o scanner.o str.o parser.o ilist.o symtab.o stack.o builtin.o expr.o tokstack.o -o compiler

scanner.o: scanner.c
	gcc ${CFLAGS} scanner.c -c

str.o: str.c
	gcc ${CFLAGS} str.c -c

parser.o: parser.c
	gcc ${CFLAGS} parser.c -c

ilist.o: ilist.c
	gcc ${CFLAGS} ilist.c -c

symtab.o: symtab.c
	gcc ${CFLAGS} symtab.c -c

expr.o: expr.c
	gcc ${CFLAGS} expr.c -c

stack.o: stack.c
	gcc ${CFLAGS} stack.c -c

builtin.o: builtin.c
	gcc ${CFLAGS} builtin.c -c

main.o: main.c
	gcc ${CFLAGS} main.c -c

tokstack.o: tokstack.c
	gcc ${CFLAGS} tokstack.c -c

clean:
	rm -f *.o *.out *.gch

test:
	tests/runtest.sh
