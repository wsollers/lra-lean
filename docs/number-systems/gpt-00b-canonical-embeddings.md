# Companion A — Canonical Embeddings Across the Number Systems

## 0. Purpose

This document records the canonical maps
\[
\mathbb N\hookrightarrow\mathbb W\hookrightarrow\mathbb Z\hookrightarrow\mathbb Q\hookrightarrow\mathbb R\hookrightarrow\mathbb C
\]
and the structures each map preserves. Each system remains formally distinct until an explicit identification convention is adopted.

## 1. Embeddings and Preservation

**Definition 1.1 (Embedding of structures).**
Let \(A\) and \(B\) be structures with specified operations, constants, and relations. An embedding \(f:A\to B\) is an injective map that preserves every specified operation, constant, and relation.

**Definition 1.2 (Order embedding).**
Let \((A,\le_A)\) and \((B,\le_B)\) be ordered sets. An order embedding is an injective map \(f:A\to B\) such that
\[
a\le_A b\quad\Longleftrightarrow\quad f(a)\le_B f(b)
\]
for all \(a,b\in A\).

**Theorem 1.3 (Composition of embeddings).**
The composition of two embeddings of the same structural signature is an embedding.

## 2. Natural Numbers into Whole Numbers

**Definition 2.1 (Natural-to-whole embedding).**
Define
\[
\iota_{\mathbb N\mathbb W}:\mathbb N\to\mathbb W
\]
by sending each natural number to the corresponding nonzero whole number.

**Theorem 2.2 (Preservation by \(\iota_{\mathbb N\mathbb W}\)).**
For all \(m,n\in\mathbb N\),
\[
\iota(m+n)=\iota(m)+\iota(n),
\qquad
\iota(mn)=\iota(m)\iota(n),
\]
\[
\iota(1)=1,
\qquad
m<n\Longleftrightarrow\iota(m)<\iota(n).
\]

**Theorem 2.3 (Image characterization).**
The image of \(\iota_{\mathbb N\mathbb W}\) is \(\mathbb W\setminus\{0\}\).

## 3. Whole Numbers into Integers

**Definition 3.1 (Whole-to-integer embedding).**
For \(n\in\mathbb W\), define
\[
\iota_{\mathbb W\mathbb Z}(n):=[(n,0)]
\]
in the ordered-pair quotient construction of \(\mathbb Z\).

**Theorem 3.2 (Semiring and order preservation).**
The map \(\iota_{\mathbb W\mathbb Z}\) is an injective semiring homomorphism and an order embedding.

**Theorem 3.3 (Nonnegative-image characterization).**
An integer lies in the image of \(\iota_{\mathbb W\mathbb Z}\) if and only if it is greater than or equal to zero.

## 4. Integers into Rationals

**Definition 4.1 (Integer-to-rational embedding).**
Define
\[
\iota_{\mathbb Z\mathbb Q}(z):=[(z,1)].
\]

**Theorem 4.2 (Ordered-ring preservation).**
The map \(\iota_{\mathbb Z\mathbb Q}\) is an injective ordered-ring homomorphism.

**Theorem 4.3 (Divisibility compatibility).**
For integers \(a,b\), if \(a\mid b\) in \(\mathbb Z\), then there exists an integer \(k\) such that
\[
\iota(b)=\iota(a)\iota(k)
\]
in \(\mathbb Q\).

**Normalization note.** The converse must be stated with an integer quotient, not an arbitrary rational quotient.

## 5. Rationals into Each Real Construction

**Definition 5.1 (Canonical rational embeddings).**
For each real construction \(\mathbb R_*\), define a canonical embedding \(\iota_*:\mathbb Q\to\mathbb R_*\) by the construction-specific constant representative:

- principal lower cut for Dedekind reals;
- constant sequence for Cauchy reals;
- constant degenerate interval sequence for interval constructions;
- canonical terminating binary expansion for dyadic/binary reals.

**Theorem 5.2 (Field and order preservation).**
Every canonical map \(\iota_*\) is an injective ordered-field homomorphism from \(\mathbb Q\) onto its image.

**Theorem 5.3 (Compatibility of comparison isomorphisms).**
Every canonical ordered-field isomorphism between two real constructions commutes with the embedded rational maps.

## 6. Reals into Complex Numbers

**Definition 6.1 (Real-to-complex embedding).**
Define
\[
\iota_{\mathbb R\mathbb C}(x):=(x,0).
\]

**Theorem 6.2 (Field preservation).**
The map \(\iota_{\mathbb R\mathbb C}\) is an injective field homomorphism.

**Theorem 6.3 (Compatibility with conjugation and modulus).**
For every \(x\in\mathbb R\),
\[
\overline{\iota(x)}=\iota(x),
\qquad
|\iota(x)|=|x|.
\]

**Theorem 6.4 (Image characterization).**
A complex number \(z\) lies in the image of \(\iota_{\mathbb R\mathbb C}\) if and only if \(\operatorname{Im}(z)=0\).

## 7. Composite Embeddings

**Definition 7.1 (Canonical composite map).**
For any two systems in the chain, define the canonical forward embedding as the composition of the adjacent canonical embeddings.

**Theorem 7.2 (Coherence).**
Any two composites formed from the adjacent canonical embeddings and having the same source and target are equal.

**Theorem 7.3 (Preservation ledger).**
Each canonical composite preserves every operation, constant, and relation shared by its source and target.

## 8. Identification Convention

**Convention 8.1 (Suppression of embeddings).**
After the relevant embedding and preservation theorems have been proved, one may identify each source system with its canonical image in the target and suppress the embedding symbol.

**Normalization note.** The first occurrence after identification should explicitly state that the identification is conventional, not literal equality of the original constructions.
