{-# LANGUAGE RecordWildCards #-}

module LLE.Advertising where

import Data.Bits
import Data.Word
import Types.Advertising

setIf :: Word8 -> Word16 -> Int -> Word16
setIf 1 w16 pos = setBit w16 pos
setIf _ w16 _ = w16

-- | Convert to Word16 of the Advertising Header.
-- ---------------------------------------------------------------------------------------------------
-- | PDUType (4 bits) | Res (2 bit) | TxAdd (1 bit) | RxAdd (1 bit) | length (6 bit) | Res (2 bit)
-- ---------------------------------------------------------------------------------------------------
toBitForm :: APDUHeader -> Word16
toBitForm APDUHeader {..} =
  let z = zeroBits
      pdut = shiftL (toEnum $ fromEnum pduType) 12
      ind = setIf rxAdd (setIf txAdd z 9) 8
      shiftLength = shiftL length 2
   in pdut .|. ind .|. shiftLength
