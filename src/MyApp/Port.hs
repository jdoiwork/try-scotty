module MyApp.Port (getPort) where

import System.Environment (lookupEnv)
import Text.Read (readMaybe)
import Network.Wai.Handler.Warp (Port)

parsePort :: Maybe String -> Maybe Port
parsePort = (>>= readMaybe)

defaultPortOr :: Maybe Port -> Port
defaultPortOr = maybe 3000 id

parsePortSafe :: Maybe String -> Port
parsePortSafe = defaultPortOr . parsePort

getPort :: IO Port
getPort = parsePortSafe <$> lookupEnv "PORT"
