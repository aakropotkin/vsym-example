#include <stdio.h>
#include <stdlib.h>


extern int foo( void );


  int
main( int argc, char * argv[], char ** envp )
{

  printf( "foo: %d\n", foo() );

  return EXIT_SUCCESS;
}
