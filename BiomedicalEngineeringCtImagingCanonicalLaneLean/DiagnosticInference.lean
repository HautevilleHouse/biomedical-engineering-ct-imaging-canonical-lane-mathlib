import PharmacokineticModel

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure DiagnosticInference where
  sensitivity : Real
  specificity : Real
  positivePredictiveValue : Real
  negativePredictiveValue : Real
  rocAUC : Real
  diagnosticThreshold : Prop

structure DiagnosticEvidence (D : DiagnosticInference) where
  diagnosticThresholdClosed : D.diagnosticThreshold
  rocAUCDefined : D.rocAUC > 0.5

def DiagnosticClosed (D : DiagnosticInference) : Prop :=
  D.diagnosticThreshold ∧ D.rocAUC > 0.5

theorem diagnostic_closed_from_evidence (D : DiagnosticInference) (E : DiagnosticEvidence D) : DiagnosticClosed D :=
  And.intro E.diagnosticThresholdClosed E.rocAUCDefined

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse
