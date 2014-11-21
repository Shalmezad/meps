TARGET=linux

all:
	lime build $(TARGET)

run:
	lime run $(TARGET)

clean:
	lime clean $(TARGET)
