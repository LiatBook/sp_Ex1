all: loops recursived recursives loopd maindloop maindrec mains

loops: libclassloops.a

libclassloops.a: advancedClassificationLoop.o basicClassification.o
	ar -rcs libclassloops.a advancedClassificationLoop.o basicClassification.o

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -fPIC -c advancedClassificationLoop.c -o advancedClassificationLoop.o

basicClassification.o: basicClassification.c NumClass.h
	gcc -Wall -g -fPIC -c basicClassification.c -o basicClassification.o


recursives: libclassrec.a

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -fPIC -c advancedClassificationRecursion.c -o advancedClassificationRecursion.o



recursived: libclassrec.so


libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	gcc -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o



loopd: libclassloops.so

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o



mains: main.o libclassrec.a
	gcc -o mains main.o libclassrec.a

main.o: main.c NumClass.h
	gcc -Wall -g -c main.c -o main.o

maindloop: main.o libclassloops.so
	gcc -o maindloop main.o ./libclassloops.so

maindrec: main.o libclassrec.so
	gcc -o maindrec main.o ./libclassrec.so

 
clean:
	rm -f *.o *.a *.so mains maindrec maindloop

.PHONY: all clean
	
