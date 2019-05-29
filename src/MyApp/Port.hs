module MyApp.Port (getPort) where

import System.Environment (lookupEnv)
import Text.Read (readMaybe)
import Data.Maybe (fromMaybe)
import Network.Wai.Handler.Warp (Port)

parsePort :: Maybe String -> Maybe Port
parsePort = (>>= readMaybe)

defaultPortOr :: Maybe Port -> Port
defaultPortOr = fromMaybe 3000

parsePortSafe :: Maybe String -> Port
parsePortSafe = defaultPortOr . parsePort

getPort :: IO Port
getPort = parsePortSafe <$> lookupEnv "PORT"
