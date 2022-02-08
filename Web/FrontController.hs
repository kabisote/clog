module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)
import IHP.LoginSupport.Middleware

-- Controller Imports
import Web.Controller.Users
import Web.Controller.Calls
import Web.Controller.PhoneNumbers
import Web.Controller.Territories
import Web.Controller.Static
import Web.Controller.Sessions

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @UsersController
        , parseRoute @CallsController
        , parseRoute @PhoneNumbersController
        , parseRoute @TerritoriesController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
