import LRA.Morphism.Properties.PreservesRelation.Definition
import LRA.Morphism.Properties.PreservesRelation.Theorems
import LRA.Morphism.Properties.ReflectsRelation.Definition
import LRA.Morphism.Properties.ReflectsRelation.Theorems
import LRA.Morphism.Properties.RelationEmbedding.Definition
import LRA.Morphism.Properties.RelationEmbedding.Theorems
import LRA.Morphism.Properties.PreservesNullaryOperation.Definition
import LRA.Morphism.Properties.PreservesNullaryOperation.Theorems
import LRA.Morphism.Properties.PreservesUnaryOperation.Definition
import LRA.Morphism.Properties.PreservesUnaryOperation.Theorems
import LRA.Morphism.Properties.PreservesBinaryOperation.Definition
import LRA.Morphism.Properties.PreservesBinaryOperation.Theorems
import LRA.Morphism.Properties.OperationEmbedding.Definition
import LRA.Morphism.Properties.OperationEmbedding.Theorems
import LRA.Morphism.Properties.StructuralEmbedding.Definition

/-!
The morphism primitives: the Prop-valued predicates saying that a function
carries one displayed piece of structure to another.

This group owns all eight of them, and every structural subject specializes
these rather than restating the quantifier:

* `PreservesRelation`, `ReflectsRelation`, `RelationEmbedding`
* `PreservesNullaryOperation`, `PreservesUnaryOperation`,
  `PreservesBinaryOperation`, `OperationEmbedding`
* `StructuralEmbedding`, which is the combination of the two embedding families

Each predicate takes a bare arrow. This group deliberately does *not* own any
bundled morphism notion: `Homomorphism` and `Congruence` belong to
`LRA.UniversalAlgebra`, `Monotone` and `OrderEmbedding` to `LRA.Order.Morphisms`,
`Continuous` to `LRA.Topology`, and so on. It also owns no order vocabulary —
"monotone" is earned only once the displayed relation is an order.
-/
