import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringCtImagingCanonicalLaneLean

structure CTScanner where
  scannerModel : Type
  detectorGeometry : Prop
  xraySource : Prop
  acquisitionSpeed : Prop

structure CTAdmittedObject where
  scanner : CTScanner
  patientModel : Prop
  scanProtocol : Prop
  imageReconstruction : Prop
  conclusion : imageReconstruction

def CTWitnessClosed (O : CTAdmittedObject) : Prop :=
  O.imageReconstruction

structure CTEndgameState where
  object : CTAdmittedObject

end BiomedicalEngineeringCtImagingCanonicalLaneLean
end HautevilleHouse