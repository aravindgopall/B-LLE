module LLE.Data where

import Data.Word
import Data.Bits
import Types.Data
import LLE.Utils

-- convert this to Word32
toBitForm :: DataHeader -> Word16
toBitForm dh =
  case cteInfo dh of
    Just cteInfo' -> withCteInfo
    Nothing -> withoutCteInfo
  where
    withoutCteInfo =
      let z = zeroBits
          llidV = shiftL (llid dh) 14
          singles = setIf (nsen dh)
                    (setIf (sn dh)
                    (setIf (md dh)
                      (setIf (cp dh) z 10) 11) 12) 13
          rfuV = shiftL (rfu dh) 8
      in llidV .|. singles .|. rfuV .|. (Types.Data.length dh)

    withCteInfo = undefined
