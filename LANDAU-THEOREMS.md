# Landau's *Foundations of Analysis* — Theorem Checklist

Working reference so the project doesn't lose track of Landau's theorem numbering while `LRA/AlgebraicStructures`, `Operators`, and `Operations` are consolidated. Paraphrased checklist only — not a transcription. Source: SRC-000372 in `lra-sources` (`D:\Readings\indexes\lra\volumes\volume-i\_sources\markdown\SRC-000372.md`).

Status column is a placeholder for later cross-referencing against Lean declarations — leave it as `-` for now, do not attempt to fill it in.

Landau's Axioms 1–5 (Peano's axioms) are intentionally omitted here — they're covered by the project's Peano-system formalization directly, not tracked as part of this theorem checklist.

## Chapter I — Natural Numbers

| # | Statement | Status |
|---|---|---|
| Theorem 1 | If x = y then x' = y' | - |
| Theorem 2 | x' ≠ x for every natural number x | - |
| Theorem 3 | If x ≠ 1 then x is the successor of some u | - |
| Theorem 4 (and Definition 1) | Addition x + y exists and is uniquely defined by x+1=x', x+y'=(x+y)' | - |
| Theorem 5 (Associative Law of Addition) | (x+y)+z = x+(y+z) | - |
| Theorem 6 (Commutative Law of Addition) | x+y = y+x | - |
| Theorem 7 | y + x ≠ x for all x, y | - |
| Theorem 8 | If y ≠ z then x+y ≠ x+z (cancellation) | - |
| Theorem 9 | For given x,y exactly one holds: x=y, x=y+u, or y=x+v | - |
| Theorem 10 | Trichotomy: for any x,y exactly one of x=y, x>y, x<y holds | - |
| Theorem 11 | If x>y then y<x | - |
| Theorem 12 | If x<y then y>x | - |
| Theorem 13 | If x=y then y≤x | - |
| Theorem 14 | If x=y then y≥x | - |
| Theorem 15 (Transitivity of Ordering) | If x<y and y<z then x<z | - |
| Theorem 16 | Mixed strict/non-strict transitivity of < gives x<z | - |
| Theorem 17 | If x≤y and y≤z then x≤z | - |
| Theorem 18 | x+y > x | - |
| Theorem 19 | Order of x,y determines order of x+z,y+z (addition preserves order) | - |
| Theorem 20 | Converse of Theorem 19: order of sums determines order of x,y | - |
| Theorem 21 | If x>y and z>u then x+z > y+u | - |
| Theorem 22 | Mixed strict/non-strict version of Theorem 21 | - |
| Theorem 23 | If x≥y and z≥u then x+z ≥ y+u | - |
| Theorem 24 | x ≥ 1 for every natural number x | - |
| Theorem 25 | If y>x then y ≥ x+1 | - |
| Theorem 26 | If y < x+1 then y ≤ x | - |
| Theorem 27 (Well-Ordering) | Every non-empty set of natural numbers has a least element | - |
| Theorem 28 (and Definition 6) | Multiplication xy exists and is uniquely defined by x·1=x, xy'=xy+x | - |
| Theorem 29 (Commutative Law of Multiplication) | xy = yx | - |
| Theorem 30 (Distributive Law) | x(y+z) = xy+xz | - |
| Theorem 31 (Associative Law of Multiplication) | (xy)z = x(yz) | - |
| Theorem 32 | Order of x,y determines order of xz,yz (multiplication preserves order) | - |
| Theorem 33 | Converse of Theorem 32: order of products determines order of x,y | - |
| Theorem 34 | If x>y and z>u then xz > yu | - |
| Theorem 35 | Mixed strict/non-strict version of Theorem 34 | - |
| Theorem 36 | If x≥y and z≥u then xz ≥ yu | - |

## Chapter II — Fractions

| # | Statement | Status |
|---|---|---|
| Theorem 37 | Fraction equivalence is reflexive: x1/x2 ~ x1/x2 | - |
| Theorem 38 | Fraction equivalence is symmetric | - |
| Theorem 39 | Fraction equivalence is transitive | - |
| Theorem 40 | x1/x2 ~ (x1·u)/(x2·u) (scaling a fraction preserves its class) | - |
| Theorem 41 | Trichotomy for fraction order: exactly one of >, =, < holds | - |
| Theorem 42 | Order of fractions reverses under swapping (x1/x2 > y1/y2 implies y1/y2 < x1/x2) | - |
| Theorem 43 | Converse ordering relation between fractions | - |
| Theorem 44 | Fraction order is preserved when replaced by equivalent representatives (> case) | - |
| Theorem 45 | Fraction order is preserved when replaced by equivalent representatives (< case) | - |
| Theorem 46 | Combining ≥ and equivalence gives ≥ for fractions | - |
| Theorem 47 | Combining ≤ and equivalence gives ≤ for fractions | - |
| Theorem 48 | Equivalence composed with order relations for fractions | - |
| Theorem 49 | Equivalence composed with order relations for fractions (dual case) | - |
| Theorem 50 (Transitivity of Ordering) | Fraction order < is transitive | - |
| Theorem 51 | Mixed strict/non-strict transitivity for fraction order | - |
| Theorem 52 | Non-strict transitivity ≤ for fractions | - |
| Theorem 53 | Given a fraction, there exists a strictly greater one | - |
| Theorem 54 | Given a fraction, there exists a strictly smaller one | - |
| Theorem 55 | Between two unequal fractions there exists an intermediate fraction (density) | - |
| Theorem 56 | Sum of fractions is well-defined on equivalence classes | - |
| Theorem 57 | Scaling both terms of a fraction sum preserves equivalence | - |
| Theorem 58 (Commutative Law of Addition) | Fraction addition is commutative | - |
| Theorem 59 (Associative Law of Addition) | Fraction addition is associative | - |
| Theorem 60 | Sum of fractions exceeds either addend | - |
| Theorem 61 | Fraction order preserved under addition (> case) | - |
| Theorem 62 | Fraction order (>, =, <) preserved under addition, all cases | - |
| Theorem 63 | Converse: order of sums determines order of addends (fractions) | - |
| Theorem 64 | If x1/x2>y1/y2 and z1/z2>u1/u2 then sum inequality holds | - |
| Theorem 65 | Mixed strict/non-strict version of Theorem 64 | - |
| Theorem 66 | Non-strict (≥) version summing two fraction inequalities | - |
| Theorem 67 (and Definition 14) | Subtraction of fractions exists uniquely when minuend exceeds subtrahend | - |
| Theorem 68 | Product of fractions is well-defined on equivalence classes | - |
| Theorem 69 (Commutative Law of Multiplication) | Fraction multiplication is commutative | - |
| Theorem 70 (Associative Law of Multiplication) | Fraction multiplication is associative | - |
| Theorem 71 (Distributive Law) | Multiplication distributes over addition for fractions | - |
| Theorem 72 | Fraction order (>,=,<) preserved under multiplication by a fixed fraction | - |
| Theorem 73 | Converse: order of products determines order of fractions | - |
| Theorem 74 | If x1/x2>y1/y2 and z1/z2>u1/u2 then product inequality holds | - |
| Theorem 75 | Mixed strict/non-strict version of Theorem 74 | - |
| Theorem 76 | Non-strict (≥) version multiplying two fraction inequalities | - |
| Theorem 77 (and Definition 15) | Division of fractions exists and is essentially unique | - |
| Theorem 78 | Rational number equality is reflexive (X=X) | - |
| Theorem 79 | Rational number equality is symmetric | - |
| Theorem 80 | Rational number equality is transitive | - |
| Theorem 81 | Trichotomy for rational numbers: exactly one of =, >, < | - |
| Theorem 82 | If X>Y then Y<X (rational numbers) | - |
| Theorem 83 | If X<Y then Y>X (rational numbers) | - |
| Theorem 84 | If X≥Y then Y≤X | - |
| Theorem 85 | If X≤Y then Y≥X | - |
| Theorem 86 (Transitivity of Ordering) | X<Y, Y<Z implies X<Z for rational numbers | - |
| Theorem 87 | Mixed strict/non-strict transitivity for rational numbers | - |
| Theorem 88 | Non-strict transitivity variant for rational numbers | - |
| Theorem 89 | Given X, there exists Z>X | - |
| Theorem 90 | Given X, there exists Z<X | - |
| Theorem 91 | Density: if X<Y there exists Z with X<Z<Y | - |
| Theorem 92 (Commutative Law of Addition) | X+Y = Y+X for rational numbers | - |
| Theorem 93 (Associative Law of Addition) | (X+Y)+Z = X+(Y+Z) for rational numbers | - |
| Theorem 94 | X+Y > X for rational numbers | - |
| Theorem 95 | If X>Y then X+Z > Y+Z | - |
| Theorem 96 | Order (>,=,<) preserved under addition of Z, all cases | - |
| Theorem 97 | Converse: order of sums determines order of X,Y | - |
| Theorem 98 | If X>Y and Z>U then X+Z > Y+U | - |
| Theorem 99 | Mixed strict/non-strict version of Theorem 98 | - |
| Theorem 100 | If X≥Y and Z≥U then X+Z ≥ Y+U | - |
| Theorem 101 (and Definition 23) | Subtraction X−Y exists uniquely when X>Y | - |
| Theorem 102 (Commutative Law of Multiplication) | XY = YX for rational numbers | - |
| Theorem 103 (Associative Law of Multiplication) | (XY)Z = X(YZ) for rational numbers | - |
| Theorem 104 (Distributive Law) | X(Y+Z) = XY+XZ for rational numbers | - |
| Theorem 105 | Order (>,=,<) preserved under multiplication by Z, all cases | - |
| Theorem 106 | Converse: order of products determines order of X,Y | - |
| Theorem 107 | If X>Y and Z>U then XZ > YU | - |
| Theorem 108 | Mixed strict/non-strict version of Theorem 107 | - |
| Theorem 109 | If X≥Y and Z≥U then XZ ≥ YU | - |
| Theorem 110 (and Definition 27) | Division YU=X has exactly one solution U (given X,Y) | - |
| Theorem 111 | Fraction order x/1 vs y/1 corresponds exactly to natural-number order of x,y | - |
| Theorem 112 | Sum and product of integers (as rationals) correspond to sum/product of naturals | - |
| Theorem 113 | The integers (as rationals) satisfy the five natural-number axioms | - |
| Theorem 114 | The rational number corresponding to fraction x/y satisfies yZ=x | - |
| Theorem 115 | Archimedean property: for any X,Y there exists z with zX > Y | - |

## Chapter III — Cuts (Reals)

| # | Statement | Status |
|---|---|---|
| Theorem 116 | Cut equality is reflexive (ξ=ξ) | - |
| Theorem 117 | Cut equality is symmetric | - |
| Theorem 118 | Cut equality is transitive | - |
| Theorem 119 | Any rational number greater than an upper number is itself an upper number | - |
| Theorem 120 | Any rational number less than a lower number is itself a lower number | - |
| Theorem 121 | If ξ>η then η<ξ | - |
| Theorem 122 | If ξ<η then η>ξ | - |
| Theorem 123 | Trichotomy for cuts: exactly one of =, >, < holds | - |
| Theorem 124 | If ξ≥η then η≤ξ | - |
| Theorem 125 | If ξ≤η then η≥ξ | - |
| Theorem 126 (Transitivity of Ordering) | ξ<η, η<ζ implies ξ<ζ for cuts | - |
| Theorem 127 | Mixed strict/non-strict transitivity for cuts | - |
| Theorem 128 | Non-strict transitivity variant for cuts | - |
| Theorem 129 (and Definition 34) | The set of sums of lower numbers is itself a cut, defining ξ+η | - |
| Theorem 130 (Commutative Law of Addition) | ξ+η = η+ξ for cuts | - |
| Theorem 131 (Associative Law of Addition) | (ξ+η)+ζ = ξ+(η+ζ) for cuts | - |
| Theorem 132 | For any rational A and cut, there exist lower X, upper U with U−X=A | - |
| Theorem 133 | ξ+η > ξ for cuts | - |
| Theorem 134 | If ξ>η then ξ+ζ > η+ζ | - |
| Theorem 135 | Order (>,=,<) preserved under addition of ζ, all cases | - |
| Theorem 136 | Converse: order of sums determines order of ξ,η | - |
| Theorem 137 | If ξ>η and ζ>ν then ξ+ζ > η+ν | - |
| Theorem 138 | Mixed strict/non-strict version of Theorem 137 | - |
| Theorem 139 | Non-strict (≥) version summing two cut inequalities | - |
| Theorem 140 (and Definition 35) | Subtraction ξ−η exists uniquely when ξ>η | - |
| Theorem 141 (and Definition 36) | The set of products of lower numbers is itself a cut, defining ξη | - |
| Theorem 142 (Commutative Law of Multiplication) | ξη = ηξ for cuts | - |
| Theorem 143 (Associative Law of Multiplication) | (ξη)ζ = ξ(ηζ) for cuts | - |
| Theorem 144 (Distributive Law) | ξ(η+ζ) = ξη+ξζ for cuts | - |
| Theorem 145 | Order (>,=,<) preserved under multiplication by ζ, all cases | - |
| Theorem 146 | Converse: order of products determines order of ξ,η | - |
| Theorem 147 | If ξ>η and ζ>ν then ξζ > ην | - |
| Theorem 148 | Mixed strict/non-strict version of Theorem 147 | - |
| Theorem 149 | If ξ≥η and ζ≥ν then ξζ ≥ ην | - |
| Theorem 150 (and Definition 37) | For rational R, the set of rationals < R forms a cut R* | - |
| Theorem 151 | ξ · 1* = ξ (1* is the multiplicative identity cut) | - |
| Theorem 152 | For any cut ξ, the equation ξν=1* has a solution ν (multiplicative inverse exists) | - |
| Theorem 153 (and Definition 38) | Division ξ/η exists and is unique for cuts | - |
| Theorem 154 | Order of rationals X,Y corresponds exactly to order of X*,Y* | - |
| Theorem 155 | Sum, difference, product, quotient of X*,Y* correspond to (X+Y)*, etc. | - |
| Theorem 156 | Integral cuts satisfy the five natural-number axioms | - |
| Theorem 157 | Rational numbers are exactly the cuts having a least upper number | - |
| Theorem 158 | X is a lower (upper) number for ξ iff X<ξ (X>ξ), comparing rational to cut | - |
| Theorem 159 | Density: if ξ<η there exists a cut Z with ξ<Z<η | - |
| Theorem 160 | Any cut Z greater than ξη can be written as a product XY with X>ξ, Y>η | - |
| Theorem 161 | For each cut ζ, the equation ξξ=ζ has exactly one solution (square roots exist) | - |
| Theorem 162 | There exists an irrational number (√2 is irrational) | - |

## Chapter IV — Real Numbers

| # | Statement | Status |
|---|---|---|
| Theorem 163 | Real number equality is reflexive (Ξ=Ξ) | - |
| Theorem 164 | Real number equality is symmetric | - |
| Theorem 165 | Real number equality is transitive | - |
| Theorem 166 | The absolute value \|Ξ\| is positive for both positive and negative Ξ | - |
| Theorem 167 | Trichotomy for real numbers: exactly one of =, >, < holds | - |
| Theorem 168 | If Ξ≥H then H≤Ξ, and conversely | - |
| Theorem 169 | Positive numbers are exactly those >0; negative are exactly those <0 | - |
| Theorem 170 | \|Ξ\| ≥ 0 for every real Ξ | - |
| Theorem 171 (Transitivity of Ordering) | Ξ<H, H<Z implies Ξ<Z for real numbers | - |
| Theorem 172 | Mixed strict/non-strict transitivity for real numbers | - |
| Theorem 173 | Non-strict transitivity variant for real numbers | - |
| Theorem 174 | Every integer is rational | - |
| Theorem 175 (Commutative Law of Addition) | Ξ+H = H+Ξ for real numbers, all sign cases | - |
| Theorem 176 | Sign of −Ξ is opposite to sign of Ξ | - |
| Theorem 177 | −(−Ξ) = Ξ | - |
| Theorem 178 | \|−Ξ\| = \|Ξ\| | - |
| Theorem 179 | Ξ+(−Ξ) = 0 | - |
| Theorem 180 | −(Ξ+H) = −Ξ+(−H) | - |
| Theorem 181 | −(Ξ−H) = H−Ξ | - |
| Theorem 182 | Sign of Ξ−H determines order relation between Ξ and H, and conversely | - |
| Theorem 183 | Order of Ξ,H reverses under negation | - |
| Theorem 184 | Every real number is a difference of two positive numbers | - |
| Theorem 185 | Addition of reals via positive-number differences is well-defined | - |
| Theorem 186 (Associative Law of Addition) | (Ξ+H)+Z = Ξ+(H+Z) for real numbers | - |
| Theorem 187 | H+Y=Ξ has exactly one solution Y = Ξ−H | - |
| Theorem 188 | Order Ξ vs H determines order of Ξ+Z vs H+Z | - |
| Theorem 189 | If Ξ>H and Z>Y then Ξ+Z > H+Y | - |
| Theorem 190 | Mixed strict/non-strict version of Theorem 189 | - |
| Theorem 191 | If Ξ≥H and Z≥Y then Ξ+Z ≥ H+Y | - |
| Theorem 192 | ΞH=0 iff at least one of Ξ,H is 0 | - |
| Theorem 193 | \|ΞH\| = \|Ξ\|\|H\| | - |
| Theorem 194 (Commutative Law of Multiplication) | ΞH = HΞ for real numbers | - |
| Theorem 195 | Ξ·1 = Ξ | - |
| Theorem 196 | Sign of ΞH determined by signs of Ξ,H | - |
| Theorem 197 | (−Ξ)H = Ξ(−H) = −(ΞH) | - |
| Theorem 198 | (−Ξ)(−H) = ΞH | - |
| Theorem 199 (Associative Law of Multiplication) | (ΞH)Z = Ξ(HZ) for real numbers | - |
| Theorem 200 | Ξ(η−ζ) = Ξη−Ξζ (distributivity over subtraction, cut case) | - |
| Theorem 201 (Distributive Law) | Ξ(H+Z) = ΞH+ΞZ for real numbers | - |
| Theorem 202 | Ξ(H−Z) = ΞH−ΞZ for real numbers | - |
| Theorem 203 | Multiplying an inequality Ξ>H by Z: order depends on sign of Z | - |
| Theorem 204 (and Definition 56) | HY=Ξ has exactly one solution Y when H≠0 (division) | - |
| Theorem 205 (Dedekind's Fundamental Theorem) | Any two-class partition of the reals (Dedekind cut) has exactly one separating real number | - |

## Chapter V — Complex Numbers

| # | Statement | Status |
|---|---|---|
| Theorem 206 | Complex number equality is reflexive (v=v) | - |
| Theorem 207 | Complex number equality is symmetric | - |
| Theorem 208 | Complex number equality is transitive | - |
| Theorem 209 (Commutative Law of Addition) | x+y = y+x for complex numbers | - |
| Theorem 210 | x + n = x, where n=[0,0] is the additive identity | - |
| Theorem 211 (Associative Law of Addition) | (x+y)+z = x+(y+z) for complex numbers | - |
| Theorem 212 (and Definition 61) | y+u=x has exactly one solution u = x−y | - |
| Theorem 213 | x−y = n iff x=y | - |
| Theorem 214 | Negation formula for a complex pair: −[Ξ1,Ξ2] = [−Ξ1,−Ξ2] | - |
| Theorem 215 | −(−x) = x for complex numbers | - |
| Theorem 216 | x+(−x) = n | - |
| Theorem 217 | −(x+y) = −x+(−y) | - |
| Theorem 218 | x−y = x+(−y) | - |
| Theorem 219 | −(x−y) = y−x | - |
| Theorem 220 (Commutative Law of Multiplication) | xy = yx for complex numbers | - |
| Theorem 221 | xy=n iff at least one of x,y equals n (no zero divisors) | - |
| Theorem 222 | xe = x, where e=[1,0] is the multiplicative identity | - |
| Theorem 223 | x(−e) = −x | - |
| Theorem 224 | (−x)y = x(−y) = −(xy) | - |
| Theorem 225 | (−x)(−y) = xy | - |
| Theorem 226 (Associative Law of Multiplication) | (xy)z = x(yz) for complex numbers | - |
| Theorem 227 (Distributive Law) | x(y+z) = xy+xz for complex numbers | - |
| Theorem 228 | x(y−z) = xy−xz | - |
| Theorem 229 (and Definition 64) | yu=x has exactly one solution u = x/y when y≠n | - |
| Theorem 230 | (x−y)+y = x | - |
| Theorem 231 | (x+y)−y = x | - |
| Theorem 232 | x−(x−y) = y | - |
| Theorem 233 | (x−y)−z = x−(y+z) | - |
| Theorem 234 | (x+y)−z = x+(y−z) | - |
| Theorem 235 | (x−y)+z = x−(y−z) | - |
| Theorem 236 | (x+z)−(y+z) = x−y | - |
| Theorem 237 | (x−y)+(z−u) = (x+z)−(y+u) | - |
| Theorem 238 | (x−y)−(z−u) = (x+u)−(y+z) | - |
| Theorem 239 | x−y = z−u iff x+u = y+z | - |
| Theorem 240 | If y≠n then x/y is well-defined and equals x times y-inverse | - |
| Theorem 241 | x/x = e for x≠n | - |
| Theorem 242 | (xy)/y = x for y≠n | - |
| Theorem 243 | x/(yz) = (x/y)/z, a nested-quotient identity | - |
| Theorem 244 | (x/y)y = x for y≠n | - |
| Theorem 245 | (x/y)/z = x/(yz) | - |
| Theorem 246 | (xy)/y = x, quotient-product cancellation variant | - |
| Theorem 247 | (x/y)/(z/u) type quotient-of-quotients identity | - |
| Theorem 248 | Quotient identity combining Theorems 247 and 246 | - |
| Theorem 249 | 1/(x/y) = y/x | - |
| Theorem 250 | x=y implies x/z = y/z | - |
| Theorem 251 | x/y = e iff x=y (for y≠n) | - |
| Theorem 252 | x/y = z/u iff xu = yz (for y,u≠n) | - |
| Theorem 253 | Quotient addition formula: x/y + z = (x+yz)/y | - |
| Theorem 254 | x/y + z/u = (xu+yz)/(yu) | - |
| Theorem 255 | Quotient subtraction formula: x/y − z = (x−yz)/y | - |
| Theorem 256 | x/y − z/u = (xu−yz)/(yu) | - |
| Theorem 257 | Complex conjugate is involutive: conj(conj(x)) = x | - |
| Theorem 258 | x = conj(x) iff x is real (second coordinate zero) | - |
| Theorem 259 | x = −conj(x) iff x is purely imaginary | - |
| Theorem 260 | conj(x+y) = conj(x)+conj(y) | - |
| Theorem 261 | conj(xy) = conj(x)conj(y) | - |
| Theorem 262 | conj(x−y) = conj(x)−conj(y) | - |
| Theorem 263 | conj(x/y) = conj(x)/conj(y) | - |
| Theorem 264 | \|x\| > 0 for x≠n, and \|n\|=0 | - |
| Theorem 265 | \|[Ξ,0]\| = \|Ξ\| (absolute value of a real pair) | - |
| Theorem 266 | Cancellation of squared absolute values recovers Ξ=H | - |
| Theorem 267 | [\|x\|,0][\|x\|,0] = x·conj(x) | - |
| Theorem 268 | \|xy\| = \|x\|\|y\| | - |
| Theorem 269 | \|x/y\| = \|x\|/\|y\| for y≠n | - |
| Theorem 270 | If x+y=e then \|x\|+\|y\| ≥ 1 | - |
| Theorem 271 (Triangle Inequality) | \|x+y\| ≤ \|x\|+\|y\| | - |
| Theorem 272 | \|−x\| = \|x\| | - |
| Theorem 273 | \|x−y\| ≥ \|\|x\|−\|y\|\| (reverse triangle inequality) | - |
| Theorem 274 | Finite sets of different sizes cannot be put in one-to-one correspondence | - |
| Theorem 275 (and Definition 69 groundwork) | Recursively defined finite sums/products g_x(n) exist and are unique | - |
| Theorem 276 | Recursive step relating g at x+1 to g at x for a sum/product | - |
| Theorem 277 | A one-term sum/product equals its single term | - |
| Theorem 278 | Sum/product over 1..x+1 splits off the last term | - |
| Theorem 279 | Sum of x copies of a constant r equals rx | - |
| Theorem 280 | Two-term sum/product formula: f(l)+f(l+1) | - |
| Theorem 281 | Splitting a sum/product over 1..x+y into two consecutive ranges | - |
| Theorem 282 | Sum of a product distributes: sum(fg) relation via distributive law across index range | - |
| Theorem 283 | A sum/product is invariant under reindexing by a permutation (rearrangement) | - |
| Theorem 284 (using Definition 70) | Splitting a general-range sum/product at an intermediate point u | - |
| Theorem 285 | Shifting the index range of a sum/product by a constant | - |
| Theorem 286 | General-range sum/product is invariant under reindexing by a permutation | - |
| Theorem 287 | Triangle inequality generalizes to sums: \|Σf(n)\| ≤ Σ\|f(n)\| | - |
| Theorem 288 | \|Πf(n)\| = Π\|f(n)\| | - |
| Theorem 289 | A product is zero iff some factor is zero | - |
| Theorem 290 (using Definition 71) | If x≠n then x^n... (nonzero base powers stay nonzero, or n^0-type identity) | - |
| Theorem 291 | x^1 = x | - |
| Theorem 292 | (xy)^n = x^n y^n (power of a product) | - |
| Theorem 293 | e^n = e (powers of the multiplicative identity) | - |
| Theorem 294 | x^(a+b) = x^a · x^b (law of exponents for addition) | - |
| Theorem 295 | x^a / x^b relation, consequence of Theorem 294 | - |
| Theorem 296 | x^(−a) = 1/x^a | - |
| Theorem 297 | (x^a)^b = x^(ab) (power of a power) | - |
| Theorem 298 | Real-pair arithmetic [Ξ,0] matches operations on Ξ (embedding reals as complex pairs) | - |
| Theorem 299 | The complex numbers [x,0] satisfy the five natural-number axioms | - |
| Theorem 300 | i·i = −1 | - |
| Theorem 301 | Every complex number has a unique representation u1+u2i with real u1,u2 | - |
