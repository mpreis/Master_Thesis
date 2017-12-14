#include <fstream>
#include <iostream>

using namespace std;

typedef struct
{
  uint8_t type;
  uint64_t address;
  uint8_t size;
} Event;

enum EventType : uint8_t
{
  LOAD = 1,
  FULL_STORE = 2,
  MODIFY = 3,
  PARTIAL_STORE = 4
};

int main()
{
	Event event;
	fstream fh;

	fh.open("./mat.trace", fstream::in | fstream::binary);
	
	while(fh.peek() != EOF)
	{
		fh.read((char*)&event.type, sizeof(event.type));
		fh.read((char*)&event.address, sizeof(event.address));
		fh.read((char*)&event.size, sizeof(event.size));

		string type;
		if (event.type == EventType::FULL_STORE)
		{
			type = string("F_STORE");
		}
		else if (event.type == EventType::PARTIAL_STORE)
		{
			type = string("P_STORE");
		}
		else if (event.type == EventType::LOAD)
		{
			type = string("LOAD");
		} 
		else if (event.type == EventType::MODIFY)
		{
			type = string("MODIFY");
		}
		else
		{
			type = string("none");
		}

		std::cout << type <<  " &" << event.address << " " << event.size << std::endl;
	}

	return 0;
}