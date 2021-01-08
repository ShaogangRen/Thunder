all : lassolver

lassolver : lassolver.h main.cc parser.h
	g++ main.cc -o lassolver -g -std=c++11 -O3 -I. 

binary_dump_libsvm : lassolver.h binary_dump_libsvm.cc parser.h
	g++ binary_dump_libsvm.cc -o binary_dump_libsvm -g -std=c++11 -O3 -I.
