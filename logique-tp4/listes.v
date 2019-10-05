(* Listes *)

Inductive liste : Type :=
| nil : liste
| C : nat -> liste -> liste.


(* Question 13 *)
(* Définition de la fonction longueur *)
Fixpoint longueur (l: liste ) : nat :=
  match l with
  | nil => 0
  | C a l => 1 + longueur l 
  end.

(* Question 14 *)
(* Définition de la fonction concat *)

Fixpoint concat (l r: liste ) : liste  :=
  match l with
  | nil => r
  | C a l => C a (concat l r) 
  end.

Compute  (concat  (C 2 nil) (C 3 nil)).

(* Question 15 *)

Theorem long (l m : liste) : longueur(concat l m) = longueur l + longueur m.
Proof.
induction l.
reflexivity.
simpl.
rewrite IHl.
reflexivity.
Qed.

(* Question 16 *)
(* Définition de la fonction ajoutqueue *)
Fixpoint ajoutqueue (a:nat) (l:liste ) : liste  :=
  match l with
  | nil => C a nil
  | C a l => C a (ajoutqueue a l) 
  end.

(* Question 17 *)
Theorem lgajout (x : nat) (l : liste) : longueur(ajoutqueue x l) = 1 + longueur l.
Proof.
Admitted.




