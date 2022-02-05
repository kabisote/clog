module Web.View.Territories.Show where
import Web.View.Prelude

data ShowView = ShowView { territory :: Territory }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>{ get #name territory }</h1>
        <p>{territory}</p>
        <div><a href={NewPhoneNumberAction (get #id territory)} class="btn btn-primary">Add Phone Number</a></div>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Territories" TerritoriesAction
                            , breadcrumbText "Show Territory"
                            ]
