#include <iostream>

int main(int argc, char **argv) {
	if(argc != 2) {
		std::cerr << "usage: " << argv[0] << " <pattern-string>" << std::endl;
		return 1;
	}

	std::string pattern(argv[1]);
	std::string line;

	while(std::getline(std::cin, line)) {
		if(line.find(pattern) != std::string::npos) {
			break;
		}
	}

	while(std::getline(std::cin, line)) {
		std::cout << line << std::endl;
	}
}
