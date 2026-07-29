import DiagnosticInference

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure SurvivalAnalysis where
  timeToEvent : Type
  censoringIndicator : Prop
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  hazardRatio : Prop
  survivalCurveComparison : Prop

structure SurvivalEvidence (S : SurvivalAnalysis) where
  censoringIndicatorClosed : S.censoringIndicator
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  hazardRatioClosed : S.hazardRatio
  survivalCurveComparisonClosed : S.survivalCurveComparison

def SurvivalClosed (S : SurvivalAnalysis) : Prop :=
  S.censoringIndicator ∧ S.kaplanMeierEstimator ∧ S.coxProportionalHazards ∧ S.hazardRatio ∧ S.survivalCurveComparison

theorem survival_closed_from_evidence (S : SurvivalAnalysis) (E : SurvivalEvidence S) : SurvivalClosed S :=
  And.intro E.censoringIndicatorClosed (And.intro E.kaplanMeierEstimatorClosed (And.intro E.coxProportionalHazardsClosed (And.intro E.hazardRatioClosed E.survivalCurveComparisonClosed)))

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse
