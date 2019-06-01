module MyAppDB where

import Control.Monad.Reader (MonadIO, MonadReader, ReaderT, asks, lift, runReaderT)
import Control.Monad.IO.Class
import Data.Text.Lazy (Text, pack)
import Text.Printf
import Web.Scotty.Trans

data Config = Config 
  { value :: !Int

  } deriving (Eq, Read, Show)

newtype ConfigM a = ConfigM
  { runConfigM :: ReaderT Config IO a
  } deriving (Applicative, Functor, Monad, MonadIO, MonadReader Config)

runIO :: ConfigM a -> IO a
runIO m = runReaderT (runConfigM m) config

config :: Config
config = Config { value = 1 }

routes :: ScottyT Text ConfigM ()
routes = do
  get "/hello" $ do
    v <- lift $ asks value
    hello <- lift getHello
    text $ pack $ printf "%s: %d" hello v
  return ()

getHello :: (MonadIO m) => m Text
getHello = return "hello"

runApp :: (MonadIO m) => m ()
runApp = do
  liftIO $ putStrLn "hello"
  
  scottyT 3000 runIO routes
