import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CTImagingRouteObligations where
  scannerHardware : Prop
  imageReconstruction : Prop
  diagnosticAccuracy : Prop
  clinicalValidation : Prop

structure CTImagingRouteEvidence (R : CTImagingRouteObligations) where
  scannerHardwareClosed : R.scannerHardware
  imageReconstructionClosed : R.imageReconstruction
  diagnosticAccuracyClosed : R.diagnosticAccuracy
  clinicalValidationClosed : R.clinicalValidation

def CTImagingRouteClosed (R : CTImagingRouteObligations) : Prop :=
  R.scannerHardware ∧ R.imageReconstruction ∧ R.diagnosticAccuracy ∧ R.clinicalValidation

theorem ct_imaging_route_closed_from_evidence
    (R : CTImagingRouteObligations) (E : CTImagingRouteEvidence R) :
    CTImagingRouteClosed R := by
  exact And.intro E.scannerHardwareClosed
    (And.intro E.imageReconstructionClosed
      (And.intro E.diagnosticAccuracyClosed E.clinicalValidationClosed))

structure CTImagingCanonicalLaneRoute (A : AdmissibleClass) where
  obligations : CTImagingRouteObligations
  evidence : CTImagingRouteEvidence obligations
  bridgeClosedFromRoute : bridgeClosed A
  gateClosedFromRoute : gateClosed A

theorem ct_imaging_route_yields_constrained_closure
    (A : AdmissibleClass) (R : CTImagingCanonicalLaneRoute A) :
    ConstrainedCTClosure A := by
  exact And.intro R.bridgeClosedFromRoute R.gateClosedFromRoute

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse