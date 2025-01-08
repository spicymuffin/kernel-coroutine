main:
	gcc -ggdb -Wall -O2 -o apl apl.c common.c
	gcc -ggdb -Wall -O2 -o ll ll.c common.c

clean:
	rm -f apl
	rm -f ll
	rm -f *.o