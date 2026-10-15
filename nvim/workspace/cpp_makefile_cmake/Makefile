CXX      := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -Iinclude
SRC      := src/main.cpp src/greeter.cpp

demo: $(SRC)
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -f demo

.PHONY: clean
