import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure RadonTransformPackage where
  projectionDomain : Type u
  sinogramSpace : Type v
  forwardTransform : projectionDomain → sinogramSpace
  inverseTransform : sinogramSpace → projectionDomain
  linearity : Prop
  shiftInvariance : Prop
  fourierSliceTheorem : Prop

def RadonTransformClosed (R : RadonTransformPackage) : Prop :=
  R.linearity ∧ R.shiftInvariance ∧ R.fourierSliceTheorem

structure RadonTransformEvidence (R : RadonTransformPackage) where
  linearityClosed : R.linearity
  shiftInvarianceClosed : R.shiftInvariance
  fourierSliceTheoremClosed : R.fourierSliceTheorem

theorem radon_transform_closed_from_evidence (R : RadonTransformPackage) (E : RadonTransformEvidence R) :
    RadonTransformClosed R := by
  exact And.intro E.linearityClosed (And.intro E.shiftInvarianceClosed E.fourierSliceTheoremClosed)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse