module Web.View.Territories.Show where
import Web.View.Prelude

newtype ShowView = ShowView { territory :: Include "phoneNumbers" Territory }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1 class="mb-4 pt-4">{ get #name territory } (Group { get #groupNumber territory })</h1>
        <div><a href={ NewPhoneNumberAction (get #id territory) } class="btn btn-primary my-4">Add Phone Number</a></div>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Phone Numbers</th>
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

renderPhoneNumber phoneNumber = [hsx|
    <tr class={ if (get #doNotCall phoneNumber) then "table-danger" :: Text else "table-default" }>
        <td><a href={ ShowPhoneNumberAction (get #id phoneNumber)}>0{ get #phoneNumber phoneNumber }</a></td>
        <td>{ get #source phoneNumber }</td>
    </tr>
|]

