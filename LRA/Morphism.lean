import LRA.Morphism.Properties

/-!
Canonical Morphism subject.

`LRA.Morphism` owns the structure-preservation primitives centrally, so that
every structural subject inherits them instead of restating them. A morphism
primitive takes an **arrow** `LRA.Function Source Target` together with the two
displayed pieces of structure it is asked to carry; it never takes a bundled
relational function, because the arrow is the working presentation.

What this subject owns:

* `Properties` — the eight Prop-valued preservation predicates.

What it deliberately does not own: the bundled morphism notions. Those stay with
the structure they preserve — `Homomorphism`, `Isomorphism`, `Embedding`, and
`Congruence` in `LRA.UniversalAlgebra`; `Monotone`, `Antitone`,
`OrderEmbedding`, and `OrderIsomorphism` in `LRA.Order.Morphisms`;
`ModelEmbedding` in `LRA.Logic.FirstOrder`; `Continuous` in `LRA.Topology`;
`Isometry` in `LRA.Analysis.MetricSpace`; `LinearMap` in `LRA.LinearAlgebra`.

Why this is a top-level subject rather than part of `LRA.UniversalAlgebra`:
universal algebra studies carriers with operations only, and its signatures have
no relation symbols. Three of the eight primitives are relational, so filing
them under universal algebra would assert something false — and it would force
`LRA.Order` to import `LRA.UniversalAlgebra` merely to say "monotone", and
`LRA.Topology` to import it to say "continuous".
-/
