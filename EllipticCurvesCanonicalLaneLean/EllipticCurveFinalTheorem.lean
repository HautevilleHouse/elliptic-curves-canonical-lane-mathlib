import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveAdmissibleClass

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

def ConstrainedEllipticCurveClosure (A : EllipticCurveAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_elliptic_curve_closure (A : EllipticCurveAdmissibleClass) : ConstrainedEllipticCurveClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse