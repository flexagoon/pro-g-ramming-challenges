// This is my first C++ program ever. Please ignore my awful code.

#include <iostream>
#include <string>

int main()
{
	std::string text;
	char letter;

	std::cout << "Enter your string:\n";
	std::cin >> text;

	std::cout << "\nEnter your letter:\n";
	std::cin >> letter;

	int count = 0;
	for (char cletter : text) {
		if (cletter == letter) {
			count += 1;
		}
	}

	std::cout << "\nLetter occurs in your string " << count << " times.\n";
	return 0;
}
