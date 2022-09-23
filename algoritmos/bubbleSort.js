var bubbleSort = function (vetor) {
    for (let i = 0; i < vetor.length; i++) {
        for (let j = 0; j < vetor.length - i - 1; j++) {
            if (vetor[j] > vetor[j + 1]) {
                let t = vetor[j];
                vetor[j] = vetor[j + 1];
                vetor[j + 1] = t;
            }
        }
    }
};

vetor = [0, 4, 6, 1, -2, 10];

console.log(vetor);

bubbleSort(vetor);

console.log(vetor);
