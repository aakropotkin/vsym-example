int foo_1( void ) { return 1; }
__asm__( ".symver foo_1,foo@FOO_1.0" );

int foo_2( void ) { return 2; }
__asm__( ".symver foo_2,foo@@FOO_2.0" );
