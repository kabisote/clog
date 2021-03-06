module Web.View.Territories.Show where
import Web.View.Prelude

data ShowView = ShowView { territory :: Territory
                         , phoneNumbers :: [Include "calls" PhoneNumber]
                         }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1 class="mb-4 pt-4">{ get #name territory } ({ if isCommonTerritory then "Common Territory" else renderGroupNumber })</h1>
        <p>
            <a href={ TerritoriesAction } class="btn btn-secondary mr-4">Back to Territories</a>
            { when isAdmin renderEditDelete }
        </p>
        <hr />
        <h3 class="my-4">Phone Numbers</h3>
        <p><a href={ NewPhoneNumberAction (get #id territory) } class="btn btn-primary">Add Phone Number</a></p>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Number</th>
                    <th scope="col">Source</th>
                    <th scope="col">Most Recent Call</th>
                </tr>
            </thead>
            <tbody>{ forEach phoneNumbers renderPhoneNumber }</tbody>
        </table>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Back" TerritoriesAction
                            , breadcrumbText "Show Territory"
                            ]

            isAdmin = get #userRole currentUser == 1
            isCommonTerritory = get #groupNumber territory == 0
            renderGroupNumber = [hsx| Group {get #groupNumber territory} |]
            renderEditDelete  = [hsx|
                    <a href={EditTerritoryAction (get #id territory)} class="text-muted">Edit</a>
                    |
                    <a href={DeleteTerritoryAction (get #id territory)} class="js-delete text-muted">Delete</a>
                |]

renderPhoneNumber :: Include "calls" PhoneNumber -> Html
renderPhoneNumber phoneNumber = [hsx|
        <tr class={ if (get #doNotCall phoneNumber) then "table-danger" :: Text else "table-default" }>
            <td><a href={ ShowPhoneNumberAction (get #id phoneNumber)}>0{ get #phoneNumber phoneNumber }</a></td>
            <td>{ get #source phoneNumber }</td>
            <td>{ forEach calls renderCall }</td>
        </tr>
    |]
    where
        calls = get #calls phoneNumber

renderCall :: Call -> Html
renderCall call = [hsx|
        {get #createdAt call |> timeAgo} by {get #agents call}
    |]

