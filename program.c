#include "stdio.h"
#include "stdlib.h"

int* read_array(int n){
    int* A = (int*) malloc(n * sizeof(int));
    for (int i = 0; i < n; ++i){
        scanf("%d", A + i);
    }
    return A;
}

void print_array(int* arr, int n){
    for (int i = 0; i < n; ++i) {
        printf("%d ", arr[i]);
    }
}

int main(){
    int n;
    scanf("%d", &n);
    int* A = read_array(n);
    int* B = (int*) malloc(n * sizeof(int));
    int len_b = 0;
    
    int x;
    scanf("%d", &x);
    for (int i = 0; i < n; ++i){
        if (A[i] % x == 0){
            B[len_b] = A[i];
            ++len_b;
        }
    }
    print_array(B, len_b);
    free(A);
    free(B);
}
