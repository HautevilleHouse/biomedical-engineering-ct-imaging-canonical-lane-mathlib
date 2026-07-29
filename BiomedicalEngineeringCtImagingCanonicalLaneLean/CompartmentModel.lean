import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CompartmentModelPackage where
  compartmentCount : ℕ
  rateConstants : Prop
  tracerKinetics : Prop
  modelIdentifiability : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  rateConstantsClosed : C.rateConstants
  tracerKineticsClosed : C.tracerKinetics
  modelIdentifiabilityClosed : C.modelIdentifiability

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.rateConstants ∧ C.tracerKinetics ∧ C.modelIdentifiability

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.rateConstantsClosed (And.intro E.tracerKineticsClosed E.modelIdentifiabilityClosed)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse