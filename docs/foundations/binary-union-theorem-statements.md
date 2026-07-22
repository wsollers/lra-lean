# Binary Union Theorem Statements

This note places the planned binary-union API side by side with its ordinary
mathematical reading. Throughout, let `M : ZFCModel`, and write

\[
x \in_M A
\]

for the Lean proposition:

```lean
zfcSetMembership M x A
```

The binary-union layer should use the proved element-level ZFC axiom readings
from:

```text
LRA/VolumeI/Set/ZFC/Semantics/AxiomReadings.lean
```

## Planned Declarations

| Mathematical statement | Lean declaration shape |
| --- | --- |
| For sets \(A,B,U \in M\), \(U\) is a binary union of \(A\) and \(B\) exactly when every element of \(U\) is an element of \(A\) or an element of \(B\):  \[\operatorname{IsBinaryUnion}_M(A,B,U) \;:\!\!\iff\; \forall x \in M,\; x \in_M U \leftrightarrow (x \in_M A \lor x \in_M B).\] | ```lean\ndef IsBinaryUnion\n    (M : ZFCModel)\n    (leftSet rightSet unionSet : M.Domain) : Prop :=\n  ∀ element : M.Domain,\n    zfcSetMembership M element unionSet ↔\n      zfcSetMembership M element leftSet ∨\n        zfcSetMembership M element rightSet\n``` |
| If \(M\) satisfies the basic ZFC axiom sentences, then every two sets \(A,B \in M\) have a binary union:  \[M \models \mathrm{BasicZFC} \to \forall A,B \in M,\; \exists U \in M,\; \operatorname{IsBinaryUnion}_M(A,B,U).\] Expanded:  \[\exists U \in M,\; \forall x \in M,\; x \in_M U \leftrightarrow (x \in_M A \lor x \in_M B).\] | ```lean\ntheorem exists_binaryUnion\n    {M : ZFCModel}\n    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M)\n    (leftSet rightSet : M.Domain) :\n    ∃ unionSet : M.Domain,\n      IsBinaryUnion M leftSet rightSet unionSet\n``` |
| If \(U\) and \(V\) are both binary unions of \(A\) and \(B\), then \(U = V\):  \[M \models \mathrm{BasicZFC} \to \operatorname{IsBinaryUnion}_M(A,B,U) \to \operatorname{IsBinaryUnion}_M(A,B,V) \to U = V.\] This uses Extensionality. | ```lean\ntheorem isBinaryUnion_unique\n    {M : ZFCModel}\n    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M)\n    {leftSet rightSet firstUnion secondUnion : M.Domain}\n    (hFirst : IsBinaryUnion M leftSet rightSet firstUnion)\n    (hSecond : IsBinaryUnion M leftSet rightSet secondUnion) :\n    firstUnion = secondUnion\n``` |
| Given \(M \models \mathrm{BasicZFC}\) and \(A,B \in M\), define \(A \cup_M B\) to be the chosen witness \(U\) such that \(\operatorname{IsBinaryUnion}_M(A,B,U)\). This is noncomputable because Lean must choose a witness from an existence theorem. | ```lean\nnoncomputable def binaryUnion\n    {M : ZFCModel}\n    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M)\n    (leftSet rightSet : M.Domain) : M.Domain :=\n  Classical.choose\n    (exists_binaryUnion hBasicAxioms leftSet rightSet)\n``` |
| The chosen binary union has exactly the expected members:  \[\forall x \in M,\; x \in_M (A \cup_M B) \leftrightarrow (x \in_M A \lor x \in_M B).\] | ```lean\ntheorem mem_binaryUnion_iff\n    {M : ZFCModel}\n    (hBasicAxioms : SatisfiesZFCBasicAxiomSentences M)\n    (leftSet rightSet element : M.Domain) :\n    zfcSetMembership M element\n        (binaryUnion hBasicAxioms leftSet rightSet) ↔\n      zfcSetMembership M element leftSet ∨\n        zfcSetMembership M element rightSet\n``` |

## Proof Dependency Summary

| Declaration | Mathematical ingredients |
| --- | --- |
| `exists_binaryUnion` | Pairing gives \(\{A,B\}\). Union gives \(\bigcup\{A,B\}\). Logic rewrites membership in that union to \(x \in_M A \lor x \in_M B\). |
| `isBinaryUnion_unique` | Extensionality: two sets with the same members are equal. |
| `binaryUnion` | `Classical.choose` applied to `exists_binaryUnion`. |
| `mem_binaryUnion_iff` | The witness property returned by `Classical.choose_spec`. |

## Why Pairing Then Union?

To build the binary union of \(A\) and \(B\), first use Pairing:

\[
\exists P,\; \forall Y,\; Y \in_M P \leftrightarrow (Y = A \lor Y = B).
\]

This set \(P\) is the unordered pair \(\{A,B\}\).

Then use the Union axiom on \(P\):

\[
\exists U,\; \forall x,\; x \in_M U
\leftrightarrow
\exists Y,\; Y \in_M P \land x \in_M Y.
\]

Combining these:

\[
x \in_M U
\leftrightarrow
\exists Y,\; (Y = A \lor Y = B) \land x \in_M Y
\leftrightarrow
x \in_M A \lor x \in_M B.
\]

So \(U\) is the binary union of \(A\) and \(B\).
