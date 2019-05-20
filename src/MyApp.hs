module MyApp (runApp) where 

import Web.Scotty

routes = do
  get "/" $ text "hello scotty"

  notFound $ text "404 not found"

runApp = scotty 3000 $ routes
