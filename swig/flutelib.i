/******************************************************
 * Swig module description file, for a C lib file.
 * Generate by saying "swig -python hellolib.i".
 ******************************************************/

%module pyFLUTE

%{
#include <flute.h>
%}

//extern char *message(char*);    
extern void readLUT(const char* POWVFILE, const char* POSTFILE);
extern DTYPE flute_wl(int d, DTYPE x[], DTYPE y[], int acc);
extern Tree flute(int d, DTYPE x[], DTYPE y[], int acc);
extern DTYPE wirelength(Tree t);
extern void printtree(Tree t);
extern void plottree(Tree t);

extern DTYPE flutes_wl_LD(int d, DTYPE xs[], DTYPE ys[], int s[]);
extern DTYPE flutes_wl_MD(int d, DTYPE xs[], DTYPE ys[], int s[], int acc);
extern DTYPE flutes_wl_RDP(int d, DTYPE xs[], DTYPE ys[], int s[], int acc);
extern Tree flutes_LD(int d, DTYPE xs[], DTYPE ys[], int s[]);
extern Tree flutes_MD(int d, DTYPE xs[], DTYPE ys[], int s[], int acc);
extern Tree flutes_HD(int d, DTYPE xs[], DTYPE ys[], int s[], int acc);
extern Tree flutes_RDP(int d, DTYPE xs[], DTYPE ys[], int s[], int acc);

/* or: %include "../HelloLib/hellolib.h"   */
/* or: %include hellolib.h, and use -I arg */