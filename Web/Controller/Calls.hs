module Web.Controller.Calls where

import Web.Controller.Prelude
import Web.View.Calls.Index
import Web.View.Calls.New
import Web.View.Calls.Edit
import Web.View.Calls.Show

instance Controller CallsController where
    action CallsAction = do
        calls <- query @Call |> fetch
        render IndexView { .. }

    action NewCallAction = do
        let call = newRecord
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
            |> ifValid \case
                Left call -> render NewView { .. } 
                Right call -> do
                    call <- call |> createRecord
                    setSuccessMessage "Call created"
                    redirectTo CallsAction

    action DeleteCallAction { callId } = do
        call <- fetch callId
        deleteRecord call
        setSuccessMessage "Call deleted"
        redirectTo CallsAction

buildCall call = call
    |> fill @["phoneNumberId","agents","remarks"]
