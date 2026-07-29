import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure WeierstrassCurve (R : Type) [CommRing R] where
  a1 : R
  a2 : R
  a3 : R
  a4 : R
  a6 : R

def discriminant (W : WeierstrassCurve R) [DecidableEq R] : R :=
  let b2 := W.a1^2 + 4*W.a2
  let b4 := 2*W.a4 + W.a1*W.a3
  let b6 := W.a3^2 + 4*W.a6
  let b8 := W.a1^2*W.a6 + 4*W.a2*W.a6 - W.a1*W.a3*W.a4 + W.a2*W.a3^2 - W.a4^2
  -b2^2*b8 - 8*b4^3 - 27*b6^2 + 9*b2*b4*b6

def jInvariant (W : WeierstrassCurve R) [DecidableEq R] : R :=
  let c4 := (W.a1^2 + 4*W.a2)^2 - 24*(2*W.a4 + W.a1*W.a3)
  c4^3 / discriminant W

structure EllipticCurve (R : Type) [CommRing R] extends WeierstrassCurve R where
  nonsingular : discriminant (toWeierstrassCurve : WeierstrassCurve R) ≠ 0

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse