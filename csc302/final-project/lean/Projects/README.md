# Project starter files

Copy the starter file for your topic (or work in it directly), keep its theorem statements,
and replace every `sorry` with a proof. Statements that mention a function you must define
yourself (`gcd`, the extended algorithm, `crt`, `minFac`, `div`/`mod`, the witness functions)
are in comment blocks: define the function, then remove the comment markers.
Check your file with `scripts/check.sh Projects/<file>.lean`. Track F files import only
`FinalProject.NNG`; all others import `FinalProject`.

| Code | Title | File |
|---|---|---|
| F1 | Strong induction and the well-ordering principle | `F1_StrongInduction.lean` |
| F2 | The division algorithm | `F2_DivisionAlgorithm.lean` |
| F3 | The integers | `F3_Integers.lean` |
| F4 | Finite sums and the binomial theorem | `F4_SumsBinomial.lean` |
| F5 | The pigeonhole principle | `F5_Pigeonhole.lean` |
| A1 | Euclid's algorithm and the extended Euclidean algorithm | `A1_Euclid.lean` |
| A2 | Cancellation in congruences and modular inverses | `A2_ModularInverse.lean` |
| A3 | The Chinese remainder theorem | `A3_ChineseRemainder.lean` |
| A4 | Fibonacci numbers and gcd | `A4_FibonacciGcd.lean` |
| B1 | There are infinitely many primes | `B1_InfinitelyManyPrimes.lean` |
| B2 | Euclid's lemma and unique factorization | `B2_UniqueFactorization.lean` |
| B3 | Irrationality of square roots | `B3_IrrationalSqrt.lean` |
| C1 | Divisibility rules | `C1_DivisibilityRules.lean` |
| C2 | Fermat's little theorem | `C2_Fermat.lean` |
| C3 | Wilson's theorem | `C3_Wilson.lean` |
| D1 | Sums of two squares | `D1_TwoSquares.lean` |
| D2 | Euler's four-square identity | `D2_FourSquareIdentity.lean` |
| D3 | Squares modulo a prime | `D3_SquaresModPrime.lean` |
| D4 | The key congruence | `D4_KeyCongruence.lean` |
| D5 | Reduction to primes, and why three squares are not enough | `D5_FourSquaresReduction.lean` |

If you propose your own topic, put it in `Projects/<YourTopic>.lean` with the same header
rules.
