import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure ImaginaryQuadraticOrder (D : ℤ) where
  discriminant : ℤ
  integers : Ring
  isImaginaryQuadratic : D < 0

def CMField (E : EllipticCurveModel ℂ) : ImaginaryQuadraticOrder := by
  sorry

def jInvariantCM (E : EllipticCurveModel ℂ) : ℂ := jInvariant E

theorem cm_j_invariant_algebraic (E : EllipticCurveModel ℂ) (hE : HasComplexMultiplication E) :
    IsIntegral ℤ (jInvariantCM E) := by
  sorry

structure CMType (K : Type) [Field K] where
  field : Type
  isNumberField : NumberField field
  endomorphismRing : Ring
  isOrder : Order

def ellipticCurveWithCM (K : Type) [Field K] : Type := Σ (E : EllipticCurveModel K), HasComplexMultiplication E

theorem cm_implies_large_endomorphism (E : EllipticCurveModel ℂ) (hE : HasComplexMultiplication E) :
    Module.rank ℤ (End E) = 2 := by
  sorry

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse