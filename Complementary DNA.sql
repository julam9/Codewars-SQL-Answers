SELECT dna, TRANSLATE(dna, 'A, T, C, G', 'T, A, G, C') AS res
FROM dnastrand