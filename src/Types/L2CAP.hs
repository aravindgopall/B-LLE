{-# LANGUAGE DuplicateRecordFields #-}
module Types.L2CAP where

import Data.Int

data ChannelIdentifier
  = Null
  | Signalling
  | ConnectionLessReception
  | Reserved
  | Dynamic

data ChannelType
  = Connection
  | ConnectionLess
  | Signal

data SignallingCommand
  = RESERVED
  | COMMANDREJECT
  | CONNECTIONREQ
  | CONNECTIONRESP
  | CONFIGUREREQ
  | CONFIGURERESP
  | DISCONNECTREQ
  | DISCONNECTRESP
  | ECHOREQ
  | ECHORESP
  | INFORMATIONREQ
  | INFORMATIONRESP

data Payload
  = ConnectionOriented
      { length :: Int16
      , channelId :: ChannelIdentifier
      , information :: Int
      }
  | ConnectionLessOriented
      { length :: Int16
      , channelId :: ChannelIdentifier
      , information :: Int
      , psm :: Int16
      }

-- Signalling Commands
data SignallingPayload
  = CommandReject
      { reason :: Int16
      , _data :: Int
      , length :: Int16
      }

data Options a = Options
  { _type :: Int8
  , length :: Int8
  , _data :: a
  }

-- _type = 0x01
-- length = 2 bytes (hence it's Options Int16)
type MTUOption = Options Int16

-- _type = 0x02
-- length = 2 bytes (hence it's Options Int16)
type FlushTimeoutOption = Options Int16
