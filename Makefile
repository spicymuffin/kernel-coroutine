main:
	gcc \
		-I/opt/intel/oneapi/vtune/latest/sdk/include \
		-ggdb -Wall -Wno-unused-result -Wno-unused-function -O3 -fPIC -pie \
		apl.c common.c \
		-L/opt/intel/oneapi/vtune/latest/lib64 \
		-littnotify \
		-march=native \
		-o apl

	gcc \
		-I/opt/intel/oneapi/vtune/latest/sdk/include \
		-ggdb -Wall -Wno-unused-result -Wno-unused-function -O3 -fPIC -pie \
		ll.c common.c \
		-L/opt/intel/oneapi/vtune/latest/lib64 \
		-littnotify \
		-march=native \
		-o ll

clean:
	rm -f apl
	rm -f ll
	rm -f *.o