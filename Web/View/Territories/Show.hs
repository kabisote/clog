module Web.View.Territories.Show where
import Web.View.Prelude

newtype ShowView = ShowView { territory :: Include "phoneNumbers" Territory }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1>{ get #name territory } (Group { get #groupNumber territory })</h1>
        <div><a href={ NewPhoneNumberAction (get #id territory) } class="btn btn-primary my-4">Add Phone Number</a></div>
        <div>{ forEach (get #phoneNumbers territory) renderPhoneNumber }</div>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Back" TerritoriesAction
                            , breadcrumbText "Show Territory"
                            ]

renderPhoneNumber phoneNumber = [hsx|
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Phone Numbers</th>
                    <th scope="col">Source</th>
                </tr>
            </thead>
            <tbody>
                <tr class={ if (get #doNotCall phoneNumber) then "table-danger" :: Text else "table-default" }>
                    <td><a href={ ShowPhoneNumberAction (get #id phoneNumber)}>0{ get #phoneNumber phoneNumber }</a></td>
                    <td>{ get #source phoneNumber }</td>
                </tr>
            </tbody>
        </table>
    |]

