#ICC Compilation
CXX_ICC = icpc
CXXFLAGS_ICC = -qopenmp -fp-model=precise
OPTFLAGS_ICC = -qopt-report=5 -qopt-report-file=$@.optrpt
LDFLAGS_ICC = -qopenmp

#GCC Compilation
CXX_GCC = g++
CXXFLAGS_GCC = -fopenmp
OPTFLAGS_GCC = 
LDFLAGS_GCC = -fopenmp

OBJ_NAME = 01_Original

CPUOBJECTS_ICC = $(OBJ_NAME).oICC MoveParticles.oICC
CPUOBJECTS_GCC = $(OBJ_NAME).oGCC MoveParticles.oGCC


TARGET = $(OBJ_NAME)_icc $(OBJ_NAME)_gcc

all: $(TARGET) instructions

$(OBJ_NAME)_icc: $(CPUOBJECTS_ICC)
	$(info )
	$(info Linking the CPU executable:)
	$(CXX_ICC) -o $@ $(CPUOBJECTS_ICC) $(LDFLAGS_ICC)

%.oICC: %.cpp
	$(info )
	$(info Compiling a CPU object file:)
	$(CXX_ICC) $(CXXFLAGS_ICC) -c $(OPTFLAGS_ICC) -o "$@" "$<"

$(OBJ_NAME)_gcc: $(CPUOBJECTS_GCC)
	$(info )
	$(info Linking the CPU executable:)
	$(CXX_GCC) -o $@ $(CPUOBJECTS_GCC) $(LDFLAGS_GCC)

%.oGCC: %.cpp
	$(info )
	$(info Compiling a CPU object file:)
	$(CXX_GCC) $(CXXFLAGS_GCC) -c $(OPTFLAGS_GCC) -o "$@" "$<"

instructions: 
	$(info )
	$(info TO EXECUTE THE APPLICATION: )
	$(info "make run-icc" or "make run-gcc" to run the application)
	$(info )

run-icc: $(TARGET)
	./$(OBJ_NAME)_icc

run-gcc: $(TARGET)
	./$(OBJ_NAME)_gcc 

clean: 
	rm -f $(CPUOBJECTS_ICC) $(CPUOBJECTS_GCC)  $(TARGET) *.optrpt
