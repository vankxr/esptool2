CFLAGS = -Os -Wall
CC = gcc
LD = gcc

all: esptool2

esptool2.o: esptool2.c esptool2.h esptool2_elf.h elf.h
	@$(CC) $(CFLAGS) -c $< -o $@

esptool2_elf.o: esptool2_elf.c esptool2.h esptool2_elf.h elf.h
	@$(CC) $(CFLAGS) -c $< -o $@

esptool2: esptool2.o esptool2_elf.o
	@$(LD) -o $@ $^

install:
	@cp ./esptool2 /usr/local/bin

clean:
	@echo "RM *.o esptool2 esptool2.exe"
	@rm -f *.o
	@rm -f esptool2 esptool2.exe
