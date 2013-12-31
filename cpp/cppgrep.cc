#include <fstream>
#include <string>
#include <iostream>
 
int main( int argc , char** argv ) {

  if ( argc != 3 ) {
    std::cout << "usage: " << argv[0] << " TOKEN FILE" << '\n';
    return 1;
  }


  std::string token( argv[1] );

  std::string line;
  std::ifstream infile( argv[ 2 ] );

  if ( infile ) {
    while ( getline( infile , line ) ) {
      if ( std::string::npos != line.find( token ) ) {
        std::cout << line << '\n';
      }
    }
  }
  
  infile.close();
  return 0;
}