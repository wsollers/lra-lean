                                                                      
                                                               

import LRA.AlgebraicStructures
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Behavior

namespace LRA.NumberSystems.RealNumbers.Dedekind

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.AlgebraicStructures
open LRA.Order

/-!
Unlike `Cauchy`, `Cut` is a subtype refinement (`{lower_set // IsCut
lower_set}`), not a quotient — `addition`/`negation`/`multiplication`/
`zero`/`one`/`strict_order`/`nonstrict_order` (`WellDefinedness.lean`,
`Equivalence.lean`) are already total functions directly on `Cut`, with
no separate raw/promoted split and no equivalence-respecting step to
prove. So none of `Operation.Laws.QuotientCompatible`'s machinery is
needed here — these become typeclass instances directly. `inverse`,
unlike the others, is partial (`cut ≠ zero rational_model` required); it
is total-ized below the standard way, `0⁻¹ := 0`.
-/

open Classical in
noncomputable def totalInverse
    (rational_model : DenselyOrderedFieldModel)
    (cut : Cut rational_model) : Cut rational_model :=
  if cut_nonzero : cut ≠ zero rational_model
  then inverse rational_model cut cut_nonzero
  else zero rational_model

noncomputable instance CutAdd (rational_model : DenselyOrderedFieldModel) :
    Add (Cut rational_model) := ⟨addition rational_model⟩

noncomputable instance CutMul (rational_model : DenselyOrderedFieldModel) :
    Mul (Cut rational_model) := ⟨multiplication rational_model⟩

noncomputable instance CutNeg (rational_model : DenselyOrderedFieldModel) :
    Neg (Cut rational_model) := ⟨negation rational_model⟩

noncomputable instance CutInv (rational_model : DenselyOrderedFieldModel) :
    Inv (Cut rational_model) := ⟨totalInverse rational_model⟩

noncomputable instance CutZero (rational_model : DenselyOrderedFieldModel) :
    OfNat (Cut rational_model) 0 := ⟨zero rational_model⟩

noncomputable instance CutOne (rational_model : DenselyOrderedFieldModel) :
    OfNat (Cut rational_model) 1 := ⟨one rational_model⟩

noncomputable instance CutLT (rational_model : DenselyOrderedFieldModel) :
    LT (Cut rational_model) := ⟨strict_order rational_model⟩

noncomputable instance CutLE (rational_model : DenselyOrderedFieldModel) :
    LE (Cut rational_model) := ⟨nonstrict_order rational_model⟩

theorem cut_field_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderedFieldLaws (Cut rational_model) := by
  sorry

theorem cut_strict_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    StrictOrderCompatibilityLaw (Cut rational_model) := by
  sorry

theorem cut_dense_order_cert
    (rational_model : DenselyOrderedFieldModel) :
    DenseOrderLaw (Cut rational_model) := by
  sorry

theorem cut_completeness_cert
    (rational_model : DenselyOrderedFieldModel) :
    OrderCompletenessLaws (Cut rational_model) (Set (Cut rational_model)) := by
  sorry

noncomputable def DedekindRealizesDenselyOrderedFieldModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.DenselyOrderedFieldModel where
  Carrier := Cut rational_model
  addInst := CutAdd rational_model
  mulInst := CutMul rational_model
  negInst := CutNeg rational_model
  invInst := CutInv rational_model
  zeroInst := CutZero rational_model
  oneInst := CutOne rational_model
  ltInst := CutLT rational_model
  leInst := CutLE rational_model
  fieldCert := cut_field_cert rational_model
  strictCert := cut_strict_order_cert rational_model
  denseCert := cut_dense_order_cert rational_model

noncomputable def DedekindRealizesRealModel
    (rational_model : DenselyOrderedFieldModel) :
    LRA.NumberSystems.Interface.ModelTheory.RealModel where
  Carrier := Cut rational_model
  addInst := CutAdd rational_model
  mulInst := CutMul rational_model
  negInst := CutNeg rational_model
  invInst := CutInv rational_model
  zeroInst := CutZero rational_model
  oneInst := CutOne rational_model
  ltInst := CutLT rational_model
  leInst := CutLE rational_model
  fieldCert := cut_field_cert rational_model
  strictCert := cut_strict_order_cert rational_model
  denseCert := cut_dense_order_cert rational_model
  completeCert := cut_completeness_cert rational_model

                                                                              
                        

                                                                             
                                                                        
                                                                          
                                                                        

             

       
                                             
                                             
                     
                                                                           
                                                                     
   
  
theorem DedekindRealizesRationalRealExtension
    (rationalSystem : RationalNumberSystem) :
    ∃ realExtension :
        LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem,
      realExtension.RealModel.Carrier = Cut rationalSystem.FieldModel := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
