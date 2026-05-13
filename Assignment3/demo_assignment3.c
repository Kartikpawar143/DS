#include <stdio.h>
#include <mpi.h>

int main(int argc, char* argv[]) {
    int rank, size, n;
    int num[100];

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (rank == 0) {
        printf("=== MPI Parallel Sum Calculation ===\n");
        scanf("%d", &n);
        for(int i = 0; i < n; i++) {
            scanf("%d", &num[i]);
        }
        printf("Array: ");
        for(int i = 0; i < n; i++) {
            printf("%d ", num[i]);
        }
        printf("\n\n");
    }

    MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Bcast(num, n, MPI_INT, 0, MPI_COMM_WORLD);

    int chunk = n / size;
    int start = rank * chunk;
    int end = (rank == size - 1) ? n : start + chunk;
    
    int local_sum = 0;
    for(int i = start; i < end; i++) {
        local_sum += num[i];
    }
    
    printf("Process %d calculating sum of elements %d-%d: %d\n", rank, start+1, end, local_sum);
    
    int global_sum;
    MPI_Reduce(&local_sum, &global_sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
    
    if (rank == 0) {
        printf("\nFinal sum = %d\n", global_sum);
    }

    MPI_Finalize();
    return 0;
}
