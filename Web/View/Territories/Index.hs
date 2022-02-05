module Web.View.Territories.Index where
import Web.View.Prelude

data IndexView = IndexView { territories :: [Territory]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Territories <a href={pathTo NewTerritoryAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Territory</th>
                        <th>Group</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach territories renderTerritory}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Territories" TerritoriesAction
                ]

renderTerritory :: Territory -> Html
renderTerritory territory = [hsx|
    <tr>
        <td>{get #name territory}</td>
        <td>{get #groupNumber territory}</td>
        <td>
            <a href={ShowTerritoryAction (get #id territory)}>Show</a>
            |
            <a href={EditTerritoryAction (get #id territory)} class="text-muted">Edit</a>
            |
            <a href={DeleteTerritoryAction (get #id territory)} class="js-delete text-muted">Delete</a>
        </td>
    </tr>
|]
