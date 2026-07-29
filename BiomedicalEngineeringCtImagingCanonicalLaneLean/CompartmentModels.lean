import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CompartmentModelPackage where
  tissueType : Type u
  contrastDynamics : Type v
  compartmentEquations : Prop
  parameterIdentifiability : Prop
  modelValidity : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  compartmentEquationsClosed : C.compartmentEquations
  parameterIdentifiabilityClosed : C.parameterIdentifiability
  modelValidityClosed : C.modelValidity

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartmentEquations ∧ C.parameterIdentifiability ∧ C.modelValidity

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.compartmentEquationsClosed
    (And.intro E.parameterIdentifiabilityClosed E.modelValidityClosed)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse