import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveGroupLaw

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

noncomputable section

structure MordellWeilGroup (E : EllipticCurve ℚ) where
  points : Set (Point E)
  add : points × points → points
  zero : points
  neg : points → points
  add_assoc : ∀ a b c : points, add (add (a, b), c) = add (a, add (b, c))
  add_comm : ∀ a b : points, add (a, b) = add (b, a)
  add_zero : ∀ a : points, add (a, zero) = a
  zero_add : ∀ a : points, add (zero, a) = a
  add_neg : ∀ a : points, add (a, neg a) = zero

end

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse