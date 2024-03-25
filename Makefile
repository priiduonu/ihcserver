TOP=.
IHCLIBS=utils 3rdparty/base64
LIBS=$(foreach i, $(IHCLIBS), $(TOP)/$(i)/lib$(notdir $(i)).a)
LDLIBS=-lpthread -lrt -lcrypto -lssl
EXEC=ihcserver
SRCS=$(shell ls *.cpp)
OBJS=$(SRCS:%.cpp=%.o)
CPPFLAGS+=-g -Wall -W
CXXFLAGS=-std=c++14

all: $(LIBS) $(OBJS)
	g++ -o $(EXEC) $(OBJS) $(LIBS) $(LDLIBS)

$(LIBS):
	make -C $(dir $@) lib

clean:
	$(foreach i, $(IHCLIBS), rm -f $(TOP)/$(i)/*.o)
	rm -f $(LIBS)
	rm -f *.o
	rm -f $(EXEC)

