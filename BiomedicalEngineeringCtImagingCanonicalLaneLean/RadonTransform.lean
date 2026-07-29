import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure RadonTransformPackage where
  projectionDomain : Type u
  sinogram : Type v
  radonTransformDefined : Prop
  inversionFormula : Prop
  rangeConditions : Prop

structure RadonTransformEvidence (R : RadonTransformPackage) where
  radonTransformDefinedClosed : R.radonTransformDefined
  inversionFormulaClosed : R.inversionFormula
  rangeConditionsClosed : R.rangeConditions

def RadonTransformClosed (R : RadonTransformPackage) : Prop :=
  R.radonTransformDefined ∧ R.inversionFormula ∧ R.rangeConditions

theorem radon_transform_closed_from_evidence (R : RadonTransformPackage) (E : RadonTransformEvidence R) : RadonTransformClosed R := by
  exact And.intro E.radonTransformDefinedClosed (And.intro E.inversionFormulaClosed E.rangeConditionsClosed)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse