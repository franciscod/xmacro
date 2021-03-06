VERSION=0.3
CXXFLAGS ?= -O2

all: xmacroplay xmacrorec xmacrorec2

xmacroplay: xmacroplay.cpp chartbl.h
	$(CXX) $(CXXFLAGS) -I/usr/X11R6/include -Wall -pedantic -DHAVE_IOSTREAM=1 -DVERSION=$(VERSION) xmacroplay.cpp -o xmacroplay -L/usr/X11R6/lib -lXtst -lX11

xmacrorec: xmacrorec.cpp
	$(CXX) $(CXXFLAGS) -I/usr/X11R6/include -Wall -pedantic -DHAVE_IOSTREAM=1 -DVERSION=$(VERSION) xmacrorec.cpp -o xmacrorec -L/usr/X11R6/lib -lXtst -lX11

xmacrorec2: xmacrorec2.cpp
	$(CXX) $(CXXFLAGS) -I/usr/X11R6/include -Wall -pedantic -DHAVE_IOSTREAM=1 -DVERSION=$(VERSION) xmacrorec2.cpp -o xmacrorec2 -L/usr/X11R6/lib -lXtst -lX11

clean:
	rm -f xmacrorec xmacroplay xmacrorec2

deb:
	umask 022 && epm -f deb -nsm xmacro

rpm:
	umask 022 && epm -f rpm -nsm xmacro
