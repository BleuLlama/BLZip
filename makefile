# Makefile for example
#

TARGA := example

SRCSCOMMON := \
	src/BLZip.cpp \
	src/BLUnZip.cpp

INCS += -Icontrib/zlib-1.2.8/contrib/minizip \
	-Icontrib/zlib-1.2.8

SRCSA := $(SRCSCOMMON) \
	src/example.cpp 

INCS += -Isrc -Icontrib

OBJSA := $(SRCSA:%.cpp=%.o)

WADA := test.zip

CFLAGS +=

################################################################################
# includes for zlib, minizip libraries
ZLIB_DIR := /Users/sdl/src/notme/zlib-1.2.8
MINIZIP_DIR :=  $(ZLIB_DIR)/contrib/minizip
CFLAGS += -I$(MINIZIP_DIR) -I$(ZLIB_DIR)
LDFLAGS += -Lcontrib
LIBS += -lMinizip -lz
################################################################################

all: $(TARGA)

%.o: %.cpp
	@echo $(CXX) $<
	@$(CXX) $(CFLAGS) $(DEFS) $(INCS) -c -o $@ $<

$(TARGA): $(OBJSA) $(WADA)
	@echo Link $@
	@$(CXX) $(CFLAGS) $(OBJSA) $(LDFLAGS) $(LIBS) -o $@

################################################################################

$(WADA):
	@echo Building test zip
	zip -rp $(WADA) makefile README.md src/example.cpp

clean:
	@echo Remove build files
	-rm -f $(OBJSA) $(TARGA) $(TARGA).exe $(WADA)
.PHONY: clean

testa: $(TARGA)
	./$(TARGA) saved
.PHONY: testa


test: testa
.PHONY: test


full: clean
	cd contrib ; make
	make test
