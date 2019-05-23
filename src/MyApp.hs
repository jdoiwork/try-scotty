module MyApp (runApp) where 

import Web.Scotty (scotty, get, notFound, text, param, json, rescue)

import qualified Services.BasicServices as BasicServices
import qualified Services.ImasServices  as ImasServices

import System.Environment (lookupEnv)

textLn t = text $ t <> "\n"
rescueOr action a = action `rescue` (\_ -> return a)

routes = do
  -- Homepage
  get "/" $ do
    textLn $ BasicServices.homepage

  -- Echo words
  get "/echo/:words" $ do
    words <- param "words"
    textLn $ BasicServices.echo words

  -- Shout words
  get "/shout/:words" $ do
    words <- param "words"
    textLn $ BasicServices.shout words

  -- Production info
  get "/productions/:id" $ do
    pro <- param "id"
    textLn $ ImasServices.president pro

  -- Idols info
  get "/idols" $ do
    q <- param "q" `rescueOr` ""
    json $ ImasServices.findIdols q

  -- ERROR! 404 NOT FOUND
  notFound $ do
    textLn $ BasicServices.notFound

getPort = do
  port <- lookupEnv "PORT"
  return $ case port of
    Nothing -> 3000
    Just n -> read n

runApp = do
  port <- getPort

  scotty port $ routes
