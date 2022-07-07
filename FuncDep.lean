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

instance : CountParts String Char Nat where
  φ haystack needle := haystack.foldl (fun acc x => acc + if x == needle then 1 else 0) 0
