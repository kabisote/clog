module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

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
    | NewCallAction
    | ShowCallAction { callId :: !(Id Call) }
    | CreateCallAction
    | EditCallAction { callId :: !(Id Call) }
    | UpdateCallAction { callId :: !(Id Call) }
    | DeleteCallAction { callId :: !(Id Call) }
    deriving (Eq, Show, Data)
