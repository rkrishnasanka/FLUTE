##################################################################
# Use SWIG to integrate hellolib.c for use in Python programs on
# Cygwin.  The DLL must have a leading "_" in its name in current
# SWIG (>1.3.13) because also makes a .py without "_" in its name.
##################################################################

PYLIB = /usr/bin
PYINC = /usr/include/python3.6
CLIB  = ../flute-3.1
SWIG  = swig

# the library plus its wrapper
_pyFLUTE.so: flutelib_wrap.o $(CLIB)/flutelib.o
	gcc -shared -fPIC flutelib_wrap.o $(CLIB)/flutelib.o -L$(PYLIB)  -o $@

# generated wrapper module code
flutelib_wrap.o: flutelib_wrap.c $(CLIB)/flute.h $(CLIB)/dl.h
	gcc -fPIC flutelib_wrap.c -g -I$(CLIB) -I$(PYINC) -c -o $@

flutelib_wrap.c: flutelib.i
	$(SWIG) -python -I$(CLIB) flutelib.i

# C library code (in another directory)
$(CLIB)/flutelib.o: $(CLIB)/flute.o $(CLIB)/dl.o $(CLIB)/err.o $(CLIB)/heap.o $(CLIB)/mst2.o $(CLIB)/neighbors.o $(CLIB)/bookshelf_IO.o $(CLIB)/memAlloc.o $(CLIB)/dist.o $(CLIB)/flute_mst.o
	# gcc -fPIC $(CLIB)/flute.c $(CLIB)/dl.c $(CLIB)/err.c $(CLIB)/heap.c $(CLIB)/mst2.c $(CLIB)/neighbors.c $(CLIB)/bookshelf_IO.c $(CLIB)/memAlloc.c $(CLIB)/dist.c $(CLIB)/flute_mst.c -g -I$(CLIB) 
	# gcc -fPIC $(CLIB)/flute.c $(CLIB)/dl.c $(CLIB)/err.c $(CLIB)/heap.c $(CLIB)/mst2.c $(CLIB)/neighbors.c $(CLIB)/bookshelf_IO.c $(CLIB)/memAlloc.c $(CLIB)/dist.c $(CLIB)/flute_mst.c -g -I$(CLIB) -S -o $(CLIB)/flutelib.o
	gcc -shared -fPIC $(CLIB)/flute.o $(CLIB)/dl.o $(CLIB)/err.o $(CLIB)/mst2.o $(CLIB)/heap.o $(CLIB)/flute_mst.o $(CLIB)/dist.o $(CLIB)/neighbors.c -g -I$(CLIB) -L$(PYLIB) -o $(CLIB)/flutelib.o  -lm

$(CLIB)/flute.o: $(CLIB)/flute.c $(CLIB)/flute.h 
	gcc -fPIC $(CLIB)/flute.c -g -I$(CLIB) -c -o $@

$(CLIB)/dl.o: $(CLIB)/dl.c $(CLIB)/dl.h
	gcc -fPIC $(CLIB)/dl.c -g -I$(CLIB) -c -o $@

$(CLIB)/err.o: $(CLIB)/err.c $(CLIB)/err.h
	gcc -fPIC $(CLIB)/err.c -g -I$(CLIB) -c -o $@
$(CLIB)/heap.o: $(CLIB)/heap.c
	gcc -fPIC $(CLIB)/heap.c -g -I$(CLIB) -c -o $@

$(CLIB)/mst2.o: $(CLIB)/mst2.c $(CLIB)/mst2.h
	gcc -fPIC $(CLIB)/mst2.c -g -I$(CLIB) -c -o $@

$(CLIB)/bookshelf_IO.o: $(CLIB)/bookshelf_IO.c $(CLIB)/bookshelf_IO.h
	gcc -fPIC $(CLIB)/bookshelf_IO.c -g -I$(CLIB) -c -o $@ -lm

$(CLIB)/memAlloc.o: $(CLIB)/memAlloc.c $(CLIB)/memAlloc.h
	gcc -fPIC $(CLIB)/memAlloc.c -g -I$(CLIB) -c -o $@

$(CLIB)/dist.o: $(CLIB)/dist.c $(CLIB)/dist.h
	gcc -fPIC $(CLIB)/dist.c -g -I$(CLIB) -c -o $@

$(CLIB)/flute_mst.o: $(CLIB)/flute_mst.c
	gcc -fPIC $(CLIB)/flute_mst.c -g -I$(CLIB) -c -o $@


clean:
	rm -f *.so *.o *.pyc core $(CLIB)/*.o
force:
	rm -f *.so *.o *.pyc core $(CLIB)/*.o flutelib_wrap.c flutelib_wrap.pya pyFLUTE.py