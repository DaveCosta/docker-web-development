######################################################################
#							             #
#                     Makefile for "LeptonMinuit"  	          	     #
#                                                                    #
#          Copyright (c) 2015  D. Emmanuel-Costa                     #
#                                                                    #
#                  Email: david.costa@tecnico.ulisboa.pt             # 
#                                                                    #
#                        Updated: 01/February/2015                   #
#                                                                    #           
######################################################################

PACKAGE  = ckm-minuit
VERSION  = $(shell date +%y%m%d)
STANDARD_C = c99
STANDARD_CXX = c++11

SRC=./src
TARGET = build

MAIN = $(TARGET)/new.exe #$(TARGET)/seesaw.exe  $(TARGET)/fcnc.exe #$(TARGET)/quarks.exe

QUARKS_OBJS = projects/quarks/main.o projects/quarks/textures.o
FCNC_OBJS = projects/fcnc/main_fcnc.o  projects/fcnc/fcnc.o
SEESAW_OBJS = projects/seesaw/main.o projects/seesaw/textures.o
NEW_OBJS = projects/e6/e6-model.o projects/e6/main.o

OBJSXX  = chi2/chi2.o 
OBJSXX += models/model_ckm.o models/model_down.o models/model_down_fixed.o models/model_neutrino.o
OBJSXX += models/seesaw/type_I.o #models/seesaw/type_I_R2.o

OBJS   = models/filling.o math/random.o pheno/data.o pheno/pheno.o 
OBJS  += matrix/matrix.o matrix/vector.o  matrix/nmatrixop.o 
OBJS  += matrix/cmatrixop.o matrix/sort.o matrix/complex.o 

OBJS  += #matrixgen/matrixgen.o

OBJS  += eigen/dsyev2.o    eigen/dsyevj3.o  eigen/slvsec3.o eigen/dsyevh3.o
OBJS  += eigen/zheevj3.o   eigen/dsyevc3.o  eigen/dsyevq3.o	eigen/dsytrd3.o
OBJS  += eigen/zheevc3.o   eigen/zheevq3.o  eigen/dsyevd3.o eigen/zheevh3.o
OBJS  += eigen/dsyevv3.o   eigen/zheevd3.o  eigen/zheevv3.o eigen/zhetrd3.o

HEADERS  = src/pheno/pheno.h  src/chi2/chi2.h src/projects/fcnc/fcnc.h #models/seesaw/type_I.h models/seesaw/type_I_R2.h
#CHEADERS += src/eigen/dsyevc3.h src/eigen/dsyevq3.h src/eigen/zheevc3.h src/eigen/zheevq3.h
#CHEADERS += src/eigen/dsyevd3.h src/eigen/dsyevv3.h src/eigen/zheevd3.h src/eigen/zheevv3.h
#CHEADERS += src/eigen/3x3.h src/eigen/dsyevh3.h src/eigen/dsytrd3.h src/eigen/zheevh3.h src/eigen/zhetrd3.h
#CHEADERS += src/eigen/dsyev2.h src/eigen/dsyevj3.h src/eigen/slvsec3.h src/eigen/zheevj3.h src/matrix/matrix.h

CXXHEADERS =  $(CHEADERS)

OBJS := $(addprefix $(TARGET)/objs/, $(OBJS))
OBJSXX := $(addprefix $(TARGET)/objs/, $(OBJSXX))

##############################################################################
# Auxiliary directories
all : $(TARGET) $(MAIN)
	@echo -n


##############################################################################
# Auxiliary directories
$(TARGET) :
	@mkdir -p $(TARGET)

##############################################################################
# Executables

$(TARGET)/quarks.exe : $(addprefix $(TARGET)/objs/, $(QUARKS_OBJS)) $(OBJS) $(OBJSXX)
	@echo Linking $@.
	@$(LDXX) -o $@ $^ $(LDXXFLAGS)
	@echo "$@ done"
	
$(TARGET)/fcnc.exe :   $(addprefix $(TARGET)/objs/, $(FCNC_OBJS)) $(OBJS) $(OBJSXX)
	@echo Linking $@.
	@$(LDXX) -o $@ $^ $(LDXXFLAGS)
	@echo "$@ done"
	
$(TARGET)/seesaw.exe : $(addprefix $(TARGET)/objs/, $(SEESAW_OBJS)) $(OBJS) $(OBJSXX)
	@echo Linking $@.
	@$(LDXX) -o $@ $^ $(LDXXFLAGS)
	@echo "$@ done"

$(TARGET)/new.exe : $(addprefix $(TARGET)/objs/, $(NEW_OBJS)) $(OBJS) $(OBJSXX)
	@echo Linking $@.
	@$(LDXX) -o $@ $^ $(LDXXFLAGS)
	@echo "$@ done"

listobjects.txt :
	    @echo $(OBJS) $(OBJSXX)

##############################################################################

# Compilers and programs used

LD   = clang #gcc
LDXX = clang++ #g++

CXX	= clang++ #g++	
CC	= clang #gcc	    
F77 = clang #gcc

AR	= ar cr
RANLIB = ar s

LEX	= flex
YACC = bison -y 

##############################################################################

#Option used for compilation

WARN = -Wall  -pedantic
OPTION = 
OPTIM = -O3 -ffast-math 
DEFS = 
LIBS = -lm 

CFLAGS	  = $(WARN) $(OPTIM) $(INCDIR) $(DEFS) $(OPTION) -std=$(STANDARD_C)
CXXFLAGS  = -std=$(STANDARD_CXX) $(WARN) $(OPTIM) $(INCDIR) $(DEFS) $(OPTION) 

LDFLAGS	  = $(LIBDIR) $(OPTION) $(LIBS)
LDXXFLAGS = $(LIBDIR) $(OPTION)	$(LIBSXX) 

##############################################################################

# ROOT Options

ROOTDIR=/usr/local/root

ROOTCXXFLAGS := $(shell $(ROOTDIR)/bin/root-config --cflags)
ROOTLIBS := $(shell  $(ROOTDIR)/bin/root-config --libs)
ROOTGLIBS :=  $(shell  $(ROOTDIR)/bin/root-config --glibs)

CXXFLAGS += -fPIC $(ROOTCXXFLAGS) 
LDXXFLAGS += -lMinuit2 $(ROOTLIBS) 

##############################################################################
#pattern rules

$(TARGET)/objs/%.o : $(SRC)/%.c
	@echo Compiling $< ...
	@mkdir -p $(dir $@)
	@$(CC) -o $@ $(CFLAGS) -c $<

$(TARGET)/objs/%.o : $(SRC)/%.cpp $(HEADERS)
	@echo Compiling $< ...
	@mkdir -p $(dir $@)
	@$(CXX) -o $@ $(CXXFLAGS) -c $<

$(TARGET)/objs/%.o : $(SRC)/%.cc
	@echo Compiling $< ...
	@mkdir -p $(dir $@)
	@$(CXX) -o $@ $(CXXFLAGS) -c $<

$(TARGET)/objs/%.o : $(SRC)/%.C
	@echo Compiling $< ...
	@mkdir -p $(dir $@)
	@$(CXX) -o $@ $(CXXFLAGS) -c $<

$(TARGET)/objs/%.o : $(SRC)/%.f
	@echo Compiling $< ...
	@mkdir -p $(dir $@)
	@$(F77) -o $@ $(F77FLAGS) -c $<

$(TARGET)/doc/%.ps : $(SRC)/%.dvi
	@echo Dvips $< ...
	@mkdir -p $(dir $@)
	@dvips $<

$(TARGET)/doc/%.dvi : $(SRC)/%.tex
	@echo Compiling LaTeX File  $< ...
	@mkdir -p $(dir $@)
	@latex $<
	@latex $<
	@latex $<

##############################################################################

.PHONY : depend clean cleanall pack info run run1

depend: 
	@echo Generating dependencies 
	@$(CXX) $(CFLAGS) -MM $(SRCS) > depend.mk

clean :
	@rm -rf $(TARGET)/objs  $(TARGET)/a.out $(wildcard *.o)
	@rm -f $(wildcard  *~ */*~ */*/*~ */*/*/*~ ) 

cleandata : 
	@rm -f $(wildcard *.dat) 

cleanall : clean
	@rm -fr $(TARGET)

info:
	@echo Eu sou a/o $(USER)
	@echo "LIBS $(LIBS)"
	@echo "CXXFLAGS=$(CXXFLAGS)"
	@echo "LDXXFLAGS=$(LDXXFLAGS)"

pack:  $(SRCS) $(HEADERS) Makefile main.cpp runner.sh
	@echo Making tar $(PACKAGE)-$(VERSION).tar.gz
	@tar czf $(PACKAGE)-$(VERSION).tar.gz $^

run: build/new.exe
	@source $(ROOTDIR)/bin/thisroot.sh ; ./build/new.exe

# DO NOT DELETE
