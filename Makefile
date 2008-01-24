MP_SOURCES=HexValue.java Map.java Parser.java Parse.java \
	ParserException.java Project.java

LF_SOURCES=Dataset.java

UT_SOURCES=ExitListener.java WindowUtilities.java

MP_CLASSES=$(MP_SOURCES:%.java=org/nyet/MapPack/%.class)
LF_CLASSES=$(LF_SOURCES:%.java=org/nyet/LogFile/%.class)
UT_CLASSES=$(UT_SOURCES:%.java=org/nyet/LogFile/%.class)

TARGETS=mapdump.class ECUxPlot.class
REFERENCE=data/4Z7907551R.kp

all: $(TARGETS)
clean:
	rm *.class

%.csv: %.kp mapdump
	./mapdump -r $(REFERENCE) $< > $@

mapdump.class: mapdump.java $(MP_CLASSES)
ECUxPlot.class: ECUxPlot.java $(LF_CLASSES)

%.class: %.java
	javac -classpath '.:jcommon-1.0.12.jar:jfreechart-1.0.9.jar:opencsv-1.8.jar' $<
