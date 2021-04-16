#include <stdio.h>
#include <stdlib.h>

extern void assFunc(int);

char c_checkValidity(int x) {
    char ret = 0;
    if(x%2 == 0)
        ret = 1;
    return ret;
} 


int main(int argc, char** argv) {
    
    char buffer[256];
    int x;
    printf("Please enter an integer number:\n");
    fgets(buffer, sizeof(buffer),stdin);
    sscanf(buffer, "%d", &x);
    printf("___\n");

    assFunc(x);
    return 0;
}