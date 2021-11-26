module Types.L2CAP where


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

data SignallingPayload
  = CommandReject
      { reason :: Int16
      , _data :: Int
      , length :: Int16
      }

