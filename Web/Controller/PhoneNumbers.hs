module Web.Controller.PhoneNumbers where

import Web.Controller.Prelude
import Web.View.PhoneNumbers.Index
import Web.View.PhoneNumbers.New
import Web.View.PhoneNumbers.Edit
import Web.View.PhoneNumbers.Show

instance Controller PhoneNumbersController where
    beforeAction = ensureIsUser

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
                    >>= pure . modify #calls (orderByDesc #createdAt)
                    >>= fetchRelated #calls
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
                    redirectTo ShowPhoneNumberAction { phoneNumberId }

    action CreatePhoneNumberAction = do
        let phoneNumber = newRecord @PhoneNumber
        phoneNumber
            |> buildPhoneNumber
            |> validateIsUnique #phoneNumber
            >>= ifValid \case
                Left phoneNumber -> do
                    territory <- fetch (get #territoryId phoneNumber)
                    render NewView { .. } 
                Right phoneNumber -> do
                    phoneNumber <- phoneNumber |> createRecord
                    setSuccessMessage "PhoneNumber created"
                    redirectTo ShowTerritoryAction { territoryId = get #territoryId phoneNumber }

    action DeletePhoneNumberAction { phoneNumberId } = do
        phoneNumber <- fetch phoneNumberId
        deleteRecord phoneNumber
        setSuccessMessage "PhoneNumber deleted"
        redirectTo ShowTerritoryAction { territoryId = get #territoryId phoneNumber }

buildPhoneNumber phoneNumber = phoneNumber
    |> fill @["phoneNumber","source","territoryId","doNotCall"]
