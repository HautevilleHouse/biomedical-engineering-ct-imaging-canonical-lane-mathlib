import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure ScannerGeometryEvidenceTerms (S : ScannerGeometryCertificate) where
  detectorArrayGeometry : S.detectorArrayGeometry
  xraySourceGeometry : S.xraySourceGeometry
  geometryCalibration : S.geometryCalibration
  geometryClosed : ScannerGeometryClosed S

def ScannerGeometryCertificate.evidenceTerms (S : ScannerGeometryCertificate) : ScannerGeometryEvidenceTerms S := {
  detectorArrayGeometry := S.detectorArrayGeometryClosed
  xraySourceGeometry := S.xraySourceGeometryClosed
  geometryCalibration := S.geometryCalibrationClosed
  geometryClosed := scanner_geometry_closed_from_evidence S S.geometryEvidence
}

structure ReconstructionEvidenceTerms (R : ReconstructionCertificate) where
  projectionDataSampling : R.projectionDataSampling
  reconstructionKernel : R.reconstructionKernel
  iterativeConvergence : R.iterativeConvergence
  reconstructionClosed : ReconstructionClosed R

def ReconstructionCertificate.evidenceTerms (R : ReconstructionCertificate) : ReconstructionEvidenceTerms R := {
  projectionDataSampling := R.projectionDataSamplingClosed
  reconstructionKernel := R.reconstructionKernelClosed
  iterativeConvergence := R.iterativeConvergenceClosed
  reconstructionClosed := reconstruction_closed_from_evidence R R.reconstructionEvidence
}

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse