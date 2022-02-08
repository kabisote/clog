module Web.Controller.Sessions where

import Web.Controller.Prelude
import Web.View.Sessions.New
import qualified IHP.AuthSupport.Controller.Sessions as Sessions
import IHP.AuthSupport.Controller.Sessions (SessionsControllerConfig)

instance Controller SessionsController where
    action NewSessionAction    = Sessions.newSessionAction @User
    action CreateSessionAction = Sessions.createSessionAction @User 
    action DeleteSessionAction = Sessions.deleteSessionAction @User

instance SessionsControllerConfig User where
    beforeLogin = updateLoginHistory
    afterLoginRedirectPath = pathTo TerritoriesAction

updateLoginHistory user = do
    user
        |> modify #logins (+ 1)
        |> updateRecord

    pure ()
