import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure DiagnosticPerformancePackage where
  sensitivity : Prop
  specificity : Prop
  rocAUC : Prop
  predictiveValues : Prop

structure DiagnosticPerformanceEvidence (D : DiagnosticPerformancePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  rocAUCClosed : D.rocAUC
  predictiveValuesClosed : D.predictiveValues

def DiagnosticPerformanceClosed (D : DiagnosticPerformancePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.rocAUC ∧ D.predictiveValues

theorem diagnostic_performance_closed_from_evidence (D : DiagnosticPerformancePackage) (E : DiagnosticPerformanceEvidence D) : DiagnosticPerformanceClosed D := by
  exact And.intro E.sensitivityClosed (And.intro E.specificityClosed (And.intro E.rocAUCClosed E.predictiveValuesClosed))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse