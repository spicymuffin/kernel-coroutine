main:
	gcc -ggdb -Wall -Wno-unused-result -Wno-unused-function -O3 -o apl apl.c common.c
	gcc -ggdb -Wall -Wno-unused-result -Wno-unused-function -O3 -o ll ll.c common.c

clean:
	rm -f apl
	rm -f ll
	rm -f *.o