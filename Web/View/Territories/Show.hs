module Web.View.Territories.Show where
import Web.View.Prelude
import Web.View.Prelude (Territory'(groupNumber))

newtype ShowView = ShowView { territory :: Include "phoneNumbers" Territory }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1 class="mb-4 pt-4">{ get #name territory } ({ if isCommonTerritory then "Common Territory" else renderGroupNumber })</h1>
        <p>
            <a href={ TerritoriesAction } class="btn btn-secondary mr-4">Back to Territories</a>
            <a href={EditTerritoryAction (get #id territory)} class="text-muted">Edit</a>
            |
            <a href={DeleteTerritoryAction (get #id territory)} class="js-delete text-muted">Delete</a>
        </p>
        <hr />
        <h3 class="my-4">Phone Numbers</h3>
        <p><a href={ NewPhoneNumberAction (get #id territory) } class="btn btn-primary">Add Phone Number</a></p>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Number</th>
                    <th scope="col">Source</th>
                </tr>
            </thead>
            <tbody>{ forEach (get #phoneNumbers territory) renderPhoneNumber }</tbody>
        </table>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Back" TerritoriesAction
                            , breadcrumbText "Show Territory"
                            ]

            isCommonTerritory = get #groupNumber territory == 0
            renderGroupNumber = [hsx| Group {get #groupNumber territory} |]

renderPhoneNumber phoneNumber = [hsx|
    <tr class={ if (get #doNotCall phoneNumber) then "table-danger" :: Text else "table-default" }>
        <td><a href={ ShowPhoneNumberAction (get #id phoneNumber)}>0{ get #phoneNumber phoneNumber }</a></td>
        <td>{ get #source phoneNumber }</td>
    </tr>
|]

