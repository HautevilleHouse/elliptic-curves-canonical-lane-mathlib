import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure FiniteField (q : ℕ) where
  char : ℕ
  order : ℕ
  field : Type
  isField : Field field
  finite : Fintype field

def HasseBound (q : ℕ) (E : EllipticCurveModel (FiniteField q).field) : ℕ := by
  have hq : q = (Fintype.card (FiniteField q).field) := sorry
  exact q + 1

def TraceOfFrobenius (K : Type) [Field K] [Fintype K] (E : EllipticCurveModel K) : ℤ := by
  let q := Fintype.card K
  let N := #{ P : E | P ≠ 0 }
  exact q + 1 - N

theorem hasse_bound_holds (K : Type) [Field K] [Fintype K] (E : EllipticCurveModel K) :
    |TraceOfFrobenius K E| ≤ 2 * √(Fintype.card K : ℝ) := by
  sorry

structure HasseBoundCertificate (K : Type) [Field K] [Fintype K] (E : EllipticCurveModel K) where
  trace : ℤ
  bound : |trace| ≤ 2 * √(Fintype.card K : ℝ)
  proof : True

def hasseAdmissibleClass (K : Type) [Field K] [Fintype K] (E : EllipticCurveModel K) : AdmissibleClass := sorry

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse