main:
	gcc -Wall -O0 -o copy_toy copy_toy.c

skiplist:
	gcc -Wall -O2 -o skiplist skiplist.c

clean:
	rm -f copy_toy \
	rm -f hello \
	rm -f skiplist \  
	rm -f *.o \ 