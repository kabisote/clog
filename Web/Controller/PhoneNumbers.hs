module Web.Controller.PhoneNumbers where

import Web.Controller.Prelude
import Web.View.PhoneNumbers.Index
import Web.View.PhoneNumbers.New
import Web.View.PhoneNumbers.Edit
import Web.View.PhoneNumbers.Show
import Web.Controller.Prelude (PhoneNumber'(territoryId))
import Web.View.PhoneNumbers.Edit (EditView(phoneNumber))

instance Controller PhoneNumbersController where
    action PhoneNumbersAction = do
        phoneNumbers <- query @PhoneNumber |> fetch
        render IndexView { .. }

    action NewPhoneNumberAction { territoryId } = do
        let phoneNumber = newRecord
                |> set #territoryId territoryId
        territory <- fetch territoryId
        render NewView { .. }

    action ShowPhoneNumberAction { phoneNumberId } = do
        phoneNumber <- fetch phoneNumberId
        render ShowView { .. }

    action EditPhoneNumberAction { phoneNumberId } = do
        phoneNumber <- fetch phoneNumberId
        render EditView { .. }

    action UpdatePhoneNumberAction { phoneNumberId } = do
        phoneNumber <- fetch phoneNumberId
        phoneNumber
            |> buildPhoneNumber
            |> ifValid \case
                Left phoneNumber -> render EditView { .. }
                Right phoneNumber -> do
                    phoneNumber <- phoneNumber |> updateRecord
                    setSuccessMessage "PhoneNumber updated"
                    redirectTo EditPhoneNumberAction { .. }

    action CreatePhoneNumberAction = do
        let phoneNumber = newRecord @PhoneNumber
        phoneNumber
            |> buildPhoneNumber
            |> ifValid \case
                Left phoneNumber -> do
                    territory <- fetch (get #territoryId phoneNumber)
                    render NewView { .. } 
                Right phoneNumber -> do
                    phoneNumber <- phoneNumber |> createRecord
                    setSuccessMessage "PhoneNumber created"
                    redirectTo PhoneNumbersAction

    action DeletePhoneNumberAction { phoneNumberId } = do
        phoneNumber <- fetch phoneNumberId
        deleteRecord phoneNumber
        setSuccessMessage "PhoneNumber deleted"
        redirectTo PhoneNumbersAction

buildPhoneNumber phoneNumber = phoneNumber
    |> fill @["phoneNumber","source","territoryId","doNotCall"]
