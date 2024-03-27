module Compute where

import Prelude

import Data.Argonaut (Json)
import Effect (Effect)
import Effect.Aff (Aff)
import PointFree ((<..))
import Promise (Promise)
import Promise.Aff (toAffE)


foreign import data InstancesClient :: Type
foreign import instancesClient_ :: Effect InstancesClient
foreign import gcpInstances_ :: InstancesClient -> Json -> Effect (Promise Json)

gcpInstances :: InstancesClient -> Json -> Aff Json
gcpInstances = toAffE <.. gcpInstances_ 

