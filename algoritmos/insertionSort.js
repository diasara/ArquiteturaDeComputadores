var insertionSort = function (vetor) {
    let x, j;

    for (let i = 2; i < vetor.length; i++) {
        x = vetor[i];
        j = i - 1;
        
        while (x < vetor[j]) {
            vetor[j + 1] = vetor[j];
            j--;
        }

        vetor[j + 1] = x;
    }
}

vetor = [7, 4, -6, 1, -2, 0];

console.log(vetor)

insertionSort(vetor);

console.log(vetor);
