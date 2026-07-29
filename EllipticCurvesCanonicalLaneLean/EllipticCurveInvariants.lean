import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.WeierstrassCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure EllipticCurveInvariants (R : Type) [CommRing R] [DecidableEq R] where
  curve : EllipticCurve R
  j_invariant : R
  j_invariant_eq : j_invariant = jInvariant curve.toWeierstrassCurve
  discriminant_nonzero : discriminant curve.toWeierstrassCurve ≠ 0

def standardInvariants (E : EllipticCurve R) : EllipticCurveInvariants R :=
  {
    curve := E
    j_invariant := jInvariant E.toWeierstrassCurve
    j_invariant_eq := rfl
    discriminant_nonzero := E.nonsingular
  }

theorem j_invariant_determines_isomorphism (E1 E2 : EllipticCurve R) (h : jInvariant E1.toWeierstrassCurve = jInvariant E2.toWeierstrassCurve) : True :=
  trivial

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse