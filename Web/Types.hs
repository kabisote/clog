module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types
import IHP.AuthSupport.Controller.Sessions (SessionsControllerConfig)

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data TerritoriesController
    = TerritoriesAction
    | NewTerritoryAction
    | ShowTerritoryAction { territoryId :: !(Id Territory) }
    | CreateTerritoryAction
    | EditTerritoryAction { territoryId :: !(Id Territory) }
    | UpdateTerritoryAction { territoryId :: !(Id Territory) }
    | DeleteTerritoryAction { territoryId :: !(Id Territory) }
    deriving (Eq, Show, Data)

data PhoneNumbersController
    = PhoneNumbersAction
    | NewPhoneNumberAction { territoryId :: !(Id Territory) }
    | ShowPhoneNumberAction { phoneNumberId :: !(Id PhoneNumber) }
    | CreatePhoneNumberAction 
    | EditPhoneNumberAction { phoneNumberId :: !(Id PhoneNumber) }
    | UpdatePhoneNumberAction { phoneNumberId :: !(Id PhoneNumber) }
    | DeletePhoneNumberAction { phoneNumberId :: !(Id PhoneNumber) }
    deriving (Eq, Show, Data)
    
data CallsController
    = CallsAction
    | NewCallAction { phoneNumberId :: !(Id PhoneNumber) }
    | ShowCallAction { callId :: !(Id Call) }
    | CreateCallAction
    | EditCallAction { callId :: !(Id Call) }
    | UpdateCallAction { callId :: !(Id Call) }
    | DeleteCallAction { callId :: !(Id Call) }
    deriving (Eq, Show, Data)

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User

data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)
