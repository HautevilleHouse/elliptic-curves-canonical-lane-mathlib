import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.ComplexMultiplicationLayer

/-!
# Final closure theorem

This module defines the constrained closure for elliptic curves and provides the epistemological proof.
-/

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

def ConstrainedEllipticCurvesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_elliptic_curves_endgame (A : AdmissibleClass) :
    ConstrainedEllipticCurvesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse