#include <iostream>

#include "greeter.hpp"

int main()
{
    int unused = 42; // clangd doit signaler cette variable inutilisée
    std::cout << greet("monde") << '\n';
    return 0;
}
