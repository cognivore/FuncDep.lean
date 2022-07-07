namespace FuncDep

class CountParts_ (S : Type u) where
  μ : Type v
  α : Type w
  φ : S → μ → α

instance : CountParts_ String where
  μ := Char
  α := Nat
  φ haystack needle := haystack.foldl (fun acc x => acc + if x == needle then 1 else 0) 0

class CountParts (S : Type u) (μ : Type v) (α : Type w) where
  φ : S → μ → α

instance (i : CountParts S μₒ αₒ) : CountParts_ S where
  μ := μₒ
  α := αₒ
  φ := i.φ

instance : CountParts String Float Char where
  φ _ _ := '?'

/- Somehow, Lean manages to see `Nat ~ CountParts_.α String` in the instance declaration! -/
instance : CountParts String Char Nat where
  φ haystack needle := FuncDep.instCountParts_String.φ haystack needle

instance : CountParts Char Float Char where
  φ _ _ := '!'

-- instance : CountParts Char Nat Bool where
--   φ _ _ := true


/-
type mismatch
  CountParts_.φ haystack needle
has type
  CountParts_.α String : Type
but is expected to have type
  Float : Type
-/
-- instance : CountParts String Char Float where
--   φ haystack needle := FuncDep.instCountParts_String.φ haystack needle
