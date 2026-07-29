import canonicalLaneMathlib.AdmissibleClass
import BiomedicalEngineeringCtImagingCanonicalLaneLean.CtReconstructionPackage

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure BiomedicalAdmittedObject where
  reconstructionPackage : CtReconstructionPackage
  reconstructionEvidence : CtReconstructionEvidence reconstructionPackage
  diagnosticConclusion : Prop
  diagnosticConclusionClosed : diagnosticConclusion

structure AdmissibleClass where
  object : BiomedicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CtReconstructionClosed A.object.reconstructionPackage

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  apply ct_reconstruction_closed_from_evidence A.object.reconstructionPackage A.object.reconstructionEvidence

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedBiomedicalCtClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biomedical_ct_endgame (A : AdmissibleClass) :
    ConstrainedBiomedicalCtClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse