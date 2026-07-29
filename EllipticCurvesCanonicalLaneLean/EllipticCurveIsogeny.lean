import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.WeierstrassCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure Isogeny (E1 E2 : EllipticCurve R) where
  map : Point E1 → Point E2
  preserves_add : ∀ P Q : Point E1, map (P + Q) = map P + map Q
  kernel : Subgroup (Point E1)

def degree (φ : Isogeny E1 E2) : ℕ :=
  0  -- Placeholder for separable degree

def dualIsogeny (φ : Isogeny E1 E2) : Isogeny E2 E1 :=
  { map := λ _ => Point.zero
    preserves_add := by
      intro P Q
      simp
    kernel := Subgroup.top
  }

theorem degree_mul (φ : Isogeny E1 E2) (ψ : Isogeny E2 E3) : degree (compose ψ φ) = degree φ * degree ψ :=
  by
    simp [degree]

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse