import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CTReconstructionPackage where
  reconstructionAlgorithm : Prop
  reconstructionCorrectness : Prop
  noiseRobustness : Prop
  artifactSuppression : Prop

structure CTReconstructionEvidence (P : CTReconstructionPackage) where
  reconstructionAlgorithmClosed : P.reconstructionAlgorithm
  reconstructionCorrectnessClosed : P.reconstructionCorrectness
  noiseRobustnessClosed : P.noiseRobustness
  artifactSuppressionClosed : P.artifactSuppression

def CTReconstructionClosed (P : CTReconstructionPackage) : Prop :=
  P.reconstructionAlgorithm ∧ P.reconstructionCorrectness ∧
  P.noiseRobustness ∧ P.artifactSuppression

theorem ct_reconstruction_closed_from_evidence
    (P : CTReconstructionPackage) (E : CTReconstructionEvidence P) :
    CTReconstructionClosed P := by
  exact And.intro E.reconstructionAlgorithmClosed
    (And.intro E.reconstructionCorrectnessClosed
      (And.intro E.noiseRobustnessClosed E.artifactSuppressionClosed))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse