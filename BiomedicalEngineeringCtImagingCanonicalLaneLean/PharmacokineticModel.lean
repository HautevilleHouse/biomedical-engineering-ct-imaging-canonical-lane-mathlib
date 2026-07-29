import ImageReconstruction

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure PharmacokineticModel where
  compartmentModel : Type
  rateConstants : Type
  initialCondition : Prop
  tracerKinetics : Prop
  parameterIdentifiability : Prop
  modelGoodnessOfFit : Prop

structure PharmacokineticEvidence (P : PharmacokineticModel) where
  initialConditionClosed : P.initialCondition
  tracerKineticsClosed : P.tracerKinetics
  parameterIdentifiabilityClosed : P.parameterIdentifiability
  modelGoodnessOfFitClosed : P.modelGoodnessOfFit

def PharmacokineticClosed (P : PharmacokineticModel) : Prop :=
  P.initialCondition ∧ P.tracerKinetics ∧ P.parameterIdentifiability ∧ P.modelGoodnessOfFit

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticModel) (E : PharmacokineticEvidence P) : PharmacokineticClosed P :=
  And.intro E.initialConditionClosed (And.intro E.tracerKineticsClosed (And.intro E.parameterIdentifiabilityClosed E.modelGoodnessOfFitClosed))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse
