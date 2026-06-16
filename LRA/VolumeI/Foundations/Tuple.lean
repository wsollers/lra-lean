namespace LRA.VolumeI.Foundations

abbrev Tuple (α : Type) (n : Nat) : Type := Fin n → α

def i₀ : Fin 2 := ⟨0, by decide⟩

def i₁ : Fin 2 := ⟨1, by decide⟩

def pair {α : Type} (first second : α) : Tuple α 2 :=
  fun index => if index.val = 0 then first else second

theorem pair_fst {α : Type} (a b : α) : pair a b i₀ = a := rfl

theorem pair_snd {α : Type} (a b : α) : pair a b i₁ = b := rfl

end LRA.VolumeI.Foundations
