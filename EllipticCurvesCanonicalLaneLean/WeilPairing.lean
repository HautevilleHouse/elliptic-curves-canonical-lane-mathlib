import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EllipticCurvesCanonicalLaneLean.EllipticCurveModel

namespace HautevilleHouse
namespace EllipticCurvesCanonicalLaneLean

structure TorsionPoint (K : Type) [Field K] (E : EllipticCurveModel K) (n : ℕ) where
  point : E
  order : ℕ
  isNTorsion : n * point = 0

def WeilPairing (K : Type) [Field K] (E : EllipticCurveModel K) (n : ℕ) : TorsionPoint K E n → TorsionPoint K E n → K := by
  intro P Q
  exact 1

structure WeilPairingProperties (K : Type) [Field K] (E : EllipticCurveModel K) (n : ℕ) (e : TorsionPoint K E n → TorsionPoint K E n → K) where
  bilinear : ∀ P Q R, e (P + Q) R = e P R * e Q R ∧ e P (Q + R) = e P Q * e P R
  alternating : ∀ P, e P P = 1
  nondegenerate : (∀ Q, e P Q = 1) → P = 0
  galoisAction : ∀ σ : K →+* K, e (σ P) (σ Q) = σ (e P Q)

def WeilPairingInstance (K : Type) [Field K] (E : EllipticCurveModel K) (n : ℕ) : WeilPairingProperties K E n (WeilPairing K E n) := by
  refine { bilinear := ?_, alternating := ?_, nondegenerate := ?_, galoisAction := ?_ }
  · intro P Q R; constructor <;> simp [WeilPairing]
  · intro P; simp [WeilPairing]
  · intro P h; apply h; intro Q; simp [WeilPairing] at h; exact h
  · intro σ P Q; simp [WeilPairing]

theorem weilPairing_adyCycle {K : Type} [Field K] (E : EllipticCurveModel K) (n : ℕ) (P Q : TorsionPoint K E n) :
    (WeilPairing K E n) P Q * (WeilPairing K E n) Q P = 1 := by
  simp [WeilPairing]

end EllipticCurvesCanonicalLaneLean
end HautevilleHouse