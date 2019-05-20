module MyApp (runApp) where 

import Web.Scotty (scotty, get, notFound, text, param)

routes = do
  get "/" $ text "hello scotty"
  get "/echo/:words" $ do
    words <- param "words"
    text $ words <> "\n"

  notFound $ text "404 not found"

runApp = scotty 3000 $ routes
