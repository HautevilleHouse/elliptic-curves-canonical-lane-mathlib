import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.WeierstrassCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure EllipticCurveAdmissibleObject where
  curve : EllipticCurve ℚ
  invariants : EllipticCurveInvariants ℚ
  groupLaw : GroupLaw (Point curve)

structure EllipticCurveAdmissibleClass where
  object : EllipticCurveAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def ellipticCurveAdmittedClosure (A : EllipticCurveAdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse