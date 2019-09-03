INCLUDE=-Iinclude

%.o:src/%.cpp
	g++ -c $< ${INCLUDE} --std=c++17 

%.o:tests/%.cpp
	g++ -c $< ${INCLUDE} --std=c++17 

all: main client

main: feverrpc.o main.o threadmanager.o utils.o include/database/db-functions.hpp include/feverrpc/threadmanager.hpp
	g++ -o bin/main feverrpc.o main.o threadmanager.o utils.o -pthread -lpqxx

client: feverrpc.o clients.o utils.o
	g++ -o bin/client $^ -pthread 

.PHONY:clean
clean:
	-rm *.o
	-rm -r bin