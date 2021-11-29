module LLE.Utils where

import Data.Bits
import Data.Word

setIf :: Word8 -> Word16 -> Int -> Word16
setIf 1 w16 pos = setBit w16 pos
setIf _ w16 _ = w16
