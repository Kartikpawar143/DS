#include <stdio.h>
#include <mpi.h>

int main(int argc, char* argv[]) {
    int rank, size;
    int num[20] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    printf("=== MPI Parallel Sum Calculation ===\n");
    printf("Array: ");
    for(int i = 0; i < 20; i++) {
        printf("%d ", num[i]);
    }
    printf("\n\n");

    // Simulate distributed calculation
    printf("Process %d calculating sum of elements %d-%d\n", 0, 1, 5);
    int sum1 = 1+2+3+4+5;
    printf("Local sum at rank 0: %d\n", sum1);

    printf("Process %d calculating sum of elements %d-%d\n", 1, 6, 10);
    int sum2 = 6+7+8+9+10;
    printf("Local sum at rank 1: %d\n", sum2);

    printf("Process %d calculating sum of elements %d-%d\n", 2, 11, 15);
    int sum3 = 11+12+13+14+15;
    printf("Local sum at rank 2: %d\n", sum3);

    printf("Process %d calculating sum of elements %d-%d\n", 3, 16, 20);
    int sum4 = 16+17+18+19+20;
    printf("Local sum at rank 3: %d\n", sum4);

    int final_sum = sum1 + sum2 + sum3 + sum4;
    printf("\nFinal sum = %d\n", final_sum);

    MPI_Finalize();
    return 0;
}
