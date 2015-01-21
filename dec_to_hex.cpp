#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	short bin_num;
	ifstream infile;
	ofstream binfile;
	binfile.open("song.mid", ios::out | ios::binary);
	
	infile.open ("data.txt");
	while(!(infile.eof())){
		infile >> bin_num;
		unsigned char a = bin_num & 0xFF;
		unsigned char b = (bin_num >> 8) & 0xFF;
		cout << bin_num << endl;
		
		binfile.write((char*)&b, 1);
		binfile.write((char*)&a, 1);
		
		
	
	}
	infile.close();
	binfile.close();
}
