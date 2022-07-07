namespace FuncDep

class CountParts (S : Type u) where
  μ : Type v
  α : Type w
  φ : S → μ → α

instance : CountParts String where
  μ := Char
  α := Nat
  φ haystack needle := haystack.foldl (fun acc x => acc + if x == needle then 1 else 0) 0
  -- φ (needle : Char) (haystack : String) := haystack.
