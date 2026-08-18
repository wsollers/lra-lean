import LRA.Function.Calculus.Classes
import LRA.Function.Calculus.Restriction
import LRA.Function.Calculus.Evaluation
import LRA.Function.Calculus.Finiteness.Definition
import LRA.Function.Calculus.Finiteness.Theorems

/-!
Function calculus specializes the generic Relation calculus.

`Classes` owns domain/range/image/preimage/fiber/kernel/saturation and the
genuinely functional image and preimage laws, `Restriction` owns restriction and
extension vocabulary, `Evaluation` relates application to the class calculus,
and `Finiteness` owns the one notion here with no relation-level analogue.

The image and preimage laws that hold of an arbitrary relation are not here:
§7.1.2 relocated them to `LRA.Set.Interface.RelationLaws`.
-/
