#include <stdio.h>

/**
 * This only works with a NON-DEFAULT version.
 * If you tried to use `foo@`, or even `foo@FOO_2.0` it will cause infinite
 * recursion.
 * I suspect that the default symbol is never emitted with an explicit
 * version, so you wind up essentially calling `foo@` recursively in
 * `wrapped_foo` ( which is emitted as the new `foo@` ).
 */
int real_foo( void );
__asm__( ".symver real_foo, foo@FOO_1.0" );

  int
wrapped_foo( void )
{
  int rsl = 0;
  printf( "PRE\n" );
  rsl = real_foo();
  printf( "RSL: %d\n", rsl );
  return rsl;
}
__asm__( ".symver wrapped_foo, foo@@WRAPPER_1.0" );
