
CC=nvcc
SOURCE=hello.cu
TARGET=hello
LIBS= -I /usr/local/cuda/include -L /usr/local/cuda/lib -lcudart 


all: compile 
compile:
	$(CC)  $(SOURCE) $(LIBS)  -o $(TARGET)

