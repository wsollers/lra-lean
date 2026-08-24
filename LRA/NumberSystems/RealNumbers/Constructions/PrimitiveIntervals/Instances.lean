                                                                                
                                                                   
                

import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Behavior

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/-!
Unlike `Dedekind` (a subtype) and like `Cauchy` (a quotient),
`PrimitiveIntervals` is already fully lifted to its quotient `Carrier` —
`addition`/`negation`/`multiplication`/`strict_order`/`zero`/`one`
(`WellDefinedness.lean`/`Operations.lean`) are already `Carrier →
Carrier → Carrier`/`Carrier → Carrier → Prop`, and `inverse`
(`Laws.lean`) is already the standard partial `value ≠ zero →
Carrier`. So — same as `Dedekind` — none of
`Operation.Laws.QuotientCompatible`'s machinery is needed here either;
these become typeclass instances directly, with `inverse` total-ized the
same `0⁻¹ := 0` way as `Dedekind`'s.
-/

open Classical in
noncomputable def totalInverse
    (rational_model : DenselyOrderedFieldModel)
    (value : Carrier rational_model) : Carrier rational_model :=
  if value_nonzero : value ≠ zero rational_model
  then inverse rational_model value value_nonzero
  else zero rational_model

noncomputable instance CarrierAdd (rational_model : DenselyOrderedFieldModel) :
    Add (Carrier rational_model) := ⟨addition rational_model⟩

noncomputable instance CarrierMul (rational_model : DenselyOrderedFieldModel) :
    Mul (Carrier rational_model) := ⟨multiplication rational_model⟩

noncomputable instance CarrierNeg (rational_model : DenselyOrderedFieldModel) :
    Neg (Carrier rational_model) := ⟨negation rational_model⟩

noncomputable instance CarrierInv (rational_model : DenselyOrderedFieldModel) :
    Inv (Carrier rational_model) := ⟨totalInverse rational_model⟩

noncomputable instance CarrierZero (rational_model : DenselyOrderedFieldModel) :
    OfNat (Carrier rational_model) 0 := ⟨zero rational_model⟩

noncomputable instance CarrierOne (rational_model : DenselyOrderedFieldModel) :
    OfNat (Carrier rational_model) 1 := ⟨one rational_model⟩

noncomputable instance CarrierLT (rational_model : DenselyOrderedFieldModel) :
    LT (Carrier rational_model) := ⟨strict_order rational_model⟩

def nonstrict_order
    (rational_model : DenselyOrderedFieldModel)
    (first second : Carrier rational_model) : Prop :=
  strict_order rational_model first second ∨ first = second

noncomputable instance CarrierLE (rational_model : DenselyOrderedFieldModel) :
    LE (Carrier rational_model) := ⟨nonstrict_order rational_model⟩

theorem carrier_field_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Carrier rational_model) := by
  sorry

theorem carrier_strict_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Carrier rational_model) := by
  sorry

theorem carrier_dense_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    DenseOrderLaw (Carrier rational_model) := by
  sorry

theorem carrier_completeness_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Carrier rational_model) (Set (Carrier rational_model)) := by
  sorry

noncomputable def PrimitiveIntervalsRealizesDenselyOrderedFieldModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Carrier rational_model
  addInst := CarrierAdd rational_model
  mulInst := CarrierMul rational_model
  negInst := CarrierNeg rational_model
  invInst := CarrierInv rational_model
  zeroInst := CarrierZero rational_model
  oneInst := CarrierOne rational_model
  ltInst := CarrierLT rational_model
  leInst := CarrierLE rational_model
  fieldCert := carrier_field_cert rational_model
  strictCert := carrier_strict_order_cert rational_model
  denseCert := carrier_dense_order_cert rational_model

noncomputable def PrimitiveIntervalsRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Carrier rational_model
  addInst := CarrierAdd rational_model
  mulInst := CarrierMul rational_model
  negInst := CarrierNeg rational_model
  invInst := CarrierInv rational_model
  zeroInst := CarrierZero rational_model
  oneInst := CarrierOne rational_model
  ltInst := CarrierLT rational_model
  leInst := CarrierLE rational_model
  fieldCert := carrier_field_cert rational_model
  strictCert := carrier_strict_order_cert rational_model
  denseCert := carrier_dense_order_cert rational_model
  completeCert := carrier_completeness_cert rational_model

                                                                             
                                                

                                                                          
                                                                             
                                                                          
                                                                            

             

       
                                                       
                                             
                     
                                                                           
                                                                         
   
  
theorem PrimitiveIntervalsRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Carrier rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
