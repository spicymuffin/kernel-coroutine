main:
	gcc -Wall -O2 -o skiplist skiplist.c common.c
	gcc -Wall -O2 -o default_ll default_ll.c common.c

clean:
	rm -f default_ll
	rm -f skiplist
	rm -f *.o