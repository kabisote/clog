module Web.Controller.Calls where

import Web.Controller.Prelude
import Web.View.Calls.Index
import Web.View.Calls.New
import Web.View.Calls.Edit
import Web.View.Calls.Show
import Web.Controller.Prelude (Call'(phoneNumberId, createdAt), PhoneNumber' (phoneNumber))

instance Controller CallsController where
    beforeAction = ensureIsUser

    action CallsAction = do
        calls <- query @Call |> fetch
        render IndexView { .. }

    action NewCallAction { phoneNumberId } = do
        currentTime <- getCurrentTime
        let call = newRecord
                |> set #createdAt currentTime
                |> set #phoneNumberId phoneNumberId
        phoneNumber <- fetch phoneNumberId
        render NewView { .. }

    action ShowCallAction { callId } = do
        call <- fetch callId
        render ShowView { .. }

    action EditCallAction { callId } = do
        call <- fetch callId
        render EditView { .. }

    action UpdateCallAction { callId } = do
        call <- fetch callId
        call
            |> buildCall
            |> ifValid \case
                Left call -> render EditView { .. }
                Right call -> do
                    call <- call |> updateRecord
                    setSuccessMessage "Call updated"
                    redirectTo EditCallAction { .. }

    action CreateCallAction = do
        let call = newRecord @Call
        call
            |> buildCall
            |> validateField #agents nonEmpty
            |> validateField #remarks nonEmpty
            |> ifValid \case
                Left call -> do
                    phoneNumber <- fetch (get #phoneNumberId call)
                    render NewView { .. } 
                Right call -> do
                    call <- call |> createRecord
                    setSuccessMessage "Call created"
                    redirectTo ShowPhoneNumberAction { phoneNumberId = get #phoneNumberId call }

    action DeleteCallAction { callId } = do
        call <- fetch callId
        deleteRecord call
        setSuccessMessage "Call deleted"
        redirectTo CallsAction

buildCall call = call
    |> fill @["phoneNumberId","agents","remarks"]
