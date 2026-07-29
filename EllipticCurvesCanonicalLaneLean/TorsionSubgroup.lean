import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure TorsionSubgroup (K : Type) [Field K] (E : EllipticCurveModel K) where
  points : Set E
  isSubgroup : IsSubgroup points
  isTorsion : ∀ P ∈ points, ∃ n : ℕ, n > 0 ∧ n • P = 0

def TorsionOrder (K : Type) [Field K] (E : EllipticCurveModel K) : ℕ := by
  let T := TorsionSubgroup K E
  exact Fintype.card T.points

theorem torsion_subgroup_finite (K : Type) [Field K] (E : EllipticCurveModel K) : Fintype (TorsionSubgroup K E) := by
  sorry

theorem mazur_torsion_theorem (K : Type) [Field K] [CharZero K] (E : EllipticCurveModel K) :
    TorsionOrder K E ≤ 16 ∨ TorsionOrder K E ∈ {1,2,3,4,5,6,7,8,9,10,12} := by
  sorry

structure TorsionStructure (K : Type) [Field K] (E : EllipticCurveModel K) where
  cyclic : Bool
  generators : List (TorsionSubgroup K E)
  order : ℕ

def torsionAdmissibleClass (K : Type) [Field K] (E : EllipticCurveModel K) : AdmissibleClass := sorry

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse