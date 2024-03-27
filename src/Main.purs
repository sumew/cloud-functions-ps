module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Functions (cloudEventHandler, httpHandler)


handleHttp :: Effect Unit
handleHttp = do
  httpHandler "handleHttp" \_ _ -> log "🍝 from httpHandler"


handleCloudEvent :: Effect Unit
handleCloudEvent = do
  cloudEventHandler "handleCloudEvent" \_ -> log "🍝"
 
