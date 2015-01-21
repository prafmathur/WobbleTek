//sending binary serial data from a file in linux. cport_nr is the com port number. 

#include <stdlib.h>
#include <stdio.h>
#include <iostream>
//#include <unistd.h>
#include "rs232.h"
#include <fstream>
#include <string>
#include <sys/stat.h>
using namespace std;

bool fileExists(const std::string& filename);

int main(int argc,char *argv[])
{

     int size_int, n,
     cport_nr = 0,               // /dev/ttyS0 (COM1 on windows)
     bdrate = 115200;            // 9600 baud
     char buf[1024], response = 0;
     unsigned char unsigned_buf[1024];
     string send = "send", receive = "receive";
     bool isbreak = false;

     if(argc != 3)
      {
          cout << "Error: you must have 2 arguments: [send/receive] and [filename]\n";
          return 1;
      }
     if (argv[1] == send)
      {
          ifstream file(argv[2], ios::in|ios::binary);
          ifstream::pos_type size;
          file.seekg (0, ios::end);
          size = file.tellg();
          size_int = (int)size;
          file.seekg (0, ios::beg);
          if (file.is_open())
           {
               for(int j = 0; j < 1024; j++)
                {
                    buf[j] = 0;
                }
          
     	       while(size_int > 1023)
       	        {
                    if(RS232_OpenComport(cport_nr, bdrate) == 1)
                     {
                         cout << "Error: cannot open comport\n";
                         return -1;
                     }
                    file.seekg (0, ios::cur);
                    file.read (buf, 1024);
                    for(int s = 0; s < 1024; s++)
                     {
                         unsigned_buf[s] = (unsigned char)buf[s]; 
                     }
                    if( RS232_SendBuf(cport_nr, unsigned_buf, 1024) == 1)
                     {
 	                     cout << "Error: couldn't send data via comport\n";
                     }
                    RS232_CloseComport(cport_nr);
                
                    size_int = size_int - 1024;
                    usleep(1000);     //Ensure that E100 has time to process the buffer
                } 
          
               file.seekg (0, ios::cur);
               file.read (buf, size_int);
               for(int s = 0; s < size_int; s++)
                {
                    unsigned_buf[s] = (unsigned char)buf[s]; 
                }
               if(RS232_OpenComport(cport_nr, bdrate) == 1)
                {
                    cout << "Error: cannot open comport\n";
                    return(0);
                }
               if( RS232_SendBuf(cport_nr, unsigned_buf, size_int) == 1)
                {
 	                cout << "Error: couldn't send data via comport\n";
                }
               for(int r = 0; r < 2; r++)
                {
                    if( RS232_SendByte(cport_nr, 0xFF) == 1)
                         cout << "Error: couldn't send data via comport\n";
                }      
               RS232_CloseComport(cport_nr);
                }
          else
           {
               cout << "Error: couldn't open file\n";
           }   
          return(0);
      }
     else if (argv[1] == receive)
      {
          if (fileExists(argv[2]))
           {
               while ((response != 'y') && (response != 'n'))
                {
                    cout << argv[2] << " already exists. Are you sure you want to overwrite it? y/n: ";
                    cin >> response;
                }
               if (response == 'n')
                    return 0;
           }

          ofstream file(argv[2], ios::out|ios::binary|ios::trunc);
          if (RS232_OpenComport(cport_nr, bdrate) == 1)
           {
               cout << "Error: cannot open comport";
               return 1;
           }
          cout << "Waiting for data from DE2...\n";
          while(1)
           {
               n = RS232_PollComport(cport_nr, unsigned_buf, 1024);
          
               if(n > 0)
                {
                    for (int k = 0; k < 1024; k++)
                     {
                         size_int = k;
                         if (unsigned_buf[k] == 0xFF && unsigned_buf[k + 1] == 0xFF)
                          {
                              isbreak = true;
                              break;
                          } 
                   
                          buf[k] = (signed char)unsigned_buf[k];
                     }
                    file.write(buf, size_int);
                    if (isbreak)
                         break;
                }
           }
          RS232_CloseComport(cport_nr);
      }
     else
      {
          cout << "Error: Invalid argument type\n";
          return 1;
      }
     return 0;
}

//function to check if a file exists
bool fileExists(const std::string& filename)
 {
     struct stat buff;
     return (stat(filename.c_str(), &buff) != -1);

 }

