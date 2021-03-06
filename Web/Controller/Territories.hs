module Web.Controller.Territories where

import Web.Controller.Prelude
import Web.View.Territories.Index
import Web.View.Territories.New
import Web.View.Territories.Edit
import Web.View.Territories.Show

instance Controller TerritoriesController where
    beforeAction = ensureIsUser

    action TerritoriesAction = do
        territories <- query @Territory
            |> orderByAsc #name 
            |> fetch
        render IndexView { .. }

    action NewTerritoryAction = do
        let territory = newRecord
        render NewView { .. }

    action ShowTerritoryAction { territoryId } = do
        territory <- fetch territoryId

        phoneNumbers <- query @PhoneNumber 
            |> filterWhere (#territoryId, territoryId) 
            |> fetch
            >>= pure . map (modify #calls (orderByDesc #createdAt))
            >>= pure . map (modify #calls (limit 1))
            >>= collectionFetchRelated #calls 
                
        render ShowView { .. }

    action EditTerritoryAction { territoryId } = do
        territory <- fetch territoryId
        render EditView { .. }

    action UpdateTerritoryAction { territoryId } = do
        territory <- fetch territoryId
        territory
            |> buildTerritory
            |> ifValid \case
                Left territory -> render EditView { .. }
                Right territory -> do
                    territory <- territory |> updateRecord
                    setSuccessMessage "Territory updated"
                    redirectTo EditTerritoryAction { .. }

    action CreateTerritoryAction = do
        let territory = newRecord @Territory
        territory
            |> buildTerritory
            |> validateField #name nonEmpty
            |> validateIsUnique #name
            >>= ifValid \case
                Left territory -> render NewView { .. } 
                Right territory -> do
                    territory <- territory |> createRecord
                    setSuccessMessage "Territory created"
                    redirectTo TerritoriesAction

    action DeleteTerritoryAction { territoryId } = do
        territory <- fetch territoryId
        deleteRecord territory
        setSuccessMessage "Territory deleted"
        redirectTo TerritoriesAction

buildTerritory territory = territory
    |> fill @["name","groupNumber"]
    |> validateField #name nonEmpty 
