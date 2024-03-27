module Functions where

import Data.Unit (Unit)
import Effect (Effect)
import Effect.Aff.Compat (EffectFn2, mkEffectFn2, runEffectFn2)

foreign import data CloudEvent :: Type
foreign import data Request :: Type
foreign import data Response :: Type

type CloudEventFunction = CloudEvent -> Effect Unit
type HTTPFunction = EffectFn2 Request Response Unit

foreign import cloudEventHandlerImpl :: EffectFn2 String CloudEventFunction  Unit
foreign import httpHandlerImpl :: EffectFn2 String HTTPFunction Unit 


cloudEventHandler :: String -> CloudEventFunction -> Effect Unit
cloudEventHandler = runEffectFn2 cloudEventHandlerImpl

httpHandler :: String -> (Request -> Response -> Effect Unit) -> Effect Unit
httpHandler name handler = runEffectFn2 httpHandlerImpl name (mkEffectFn2 handler)
