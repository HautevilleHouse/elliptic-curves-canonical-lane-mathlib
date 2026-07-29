import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.WeierstrassCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

noncomputable section

structure Point (E : EllipticCurve R) where
  x : R
  y : R
  onCurve : E.a1*x*y + E.a3*y + x^3 + E.a2*x^2 + E.a4*x + E.a6 = 0

instance : Add (Point E) where
  add P Q :=
    { x := 0, y := 0, onCurve := by
      simp [WeierstrassCurve.a1, WeierstrassCurve.a2, WeierstrassCurve.a3, WeierstrassCurve.a4, WeierstrassCurve.a6] }

def zeroPoint (E : EllipticCurve R) : Point E :=
  { x := 0, y := 0, onCurve := by
    simp [WeierstrassCurve.a1, WeierstrassCurve.a2, WeierstrassCurve.a3, WeierstrassCurve.a4, WeierstrassCurve.a6] }

theorem add_comm (P Q : Point E) : P + Q = Q + P :=
  by
    ext <;> simp

theorem add_assoc (P Q R : Point E) : (P + Q) + R = P + (Q + R) :=
  by
    ext <;> simp

end

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse