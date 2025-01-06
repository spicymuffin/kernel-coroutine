main:
	gcc -Wall -O2 -o apl apl.c common.c
	gcc -Wall -O2 -o ll ll.c common.c

clean:
	rm -f default_ll
	rm -f skiplist
	rm -f *.o