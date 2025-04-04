main:
	gcc -o coro coro.c
	gcc -o coro_simplified coro_simplified.c

debug: coro.c
	gcc -g -o coro coro.c
	gcc -g -o coros coro_simplified.c

clean:
	rm -f coro coros
