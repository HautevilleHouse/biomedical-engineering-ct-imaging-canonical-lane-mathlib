import canonicalLaneMathlib.AdmissibleClass
import CompartmentModels

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure PharmacokineticsPackage {C : CompartmentModelPackage} where
  inputFunction : Prop
  rateConstants : Prop
  timeActivityCurves : Prop
  tracerKineticModel : Prop
  parameterEstimation : Prop

structure PharmacokineticsEvidence {C : CompartmentModelPackage}
    (P : PharmacokineticsPackage C) where
  inputFunctionClosed : P.inputFunction
  rateConstantsClosed : P.rateConstants
  timeActivityCurvesClosed : P.timeActivityCurves
  tracerKineticModelClosed : P.tracerKineticModel
  parameterEstimationClosed : P.parameterEstimation

def PharmacokineticsClosed {C : CompartmentModelPackage}
    (P : PharmacokineticsPackage C) : Prop :=
  P.inputFunction ∧ P.rateConstants ∧ P.timeActivityCurves ∧
  P.tracerKineticModel ∧ P.parameterEstimation

theorem pharmacokinetics_closed_from_evidence {C : CompartmentModelPackage}
    (P : PharmacokineticsPackage C) (E : PharmacokineticsEvidence P) :
    PharmacokineticsClosed P := by
  exact And.intro E.inputFunctionClosed
    (And.intro E.rateConstantsClosed
      (And.intro E.timeActivityCurvesClosed
        (And.intro E.tracerKineticModelClosed E.parameterEstimationClosed)))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse