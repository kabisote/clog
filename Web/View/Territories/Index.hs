module Web.View.Territories.Index where
import Web.View.Prelude

newtype IndexView = IndexView { territories :: [Territory]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
            <h1 class="mb-4 pt-4">Territories</h1>
            <p> <a href={pathTo NewTerritoryAction} class="btn btn-primary">Add Territory</a></p>

            <div class="row  row-cols-1 row-cols-md-2 g-4">
                <!-- Group Territory -->
                <div class="col">
                    <div class="card my-4">
                        <h5 class="card-header">Group {get #groupNumber currentUser} Territory</h5>
                        <div class="list-group list-group-flush">
                            {forEach territories renderGroupTerritory}
                        </div>
                    </div>
                </div>

                <!-- Common Territory -->
                <div class="col">
                    <div class="card my-4">
                        <h5 class="card-header">Common Territory</h5>
                        <ul class="list-group list-group-flush">
                            {forEach territories renderCommonTerritory}
                        </ul>
                    </div>
                </div>

            </div>
        |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Territories" TerritoriesAction
                ]



renderGroupTerritory :: Territory -> Html
renderGroupTerritory territory = [hsx|
        {when (get #groupNumber currentUser == get #groupNumber territory) (territoryDetails territory)}
    |]


renderCommonTerritory :: Territory -> Html
renderCommonTerritory territory = [hsx|
        {when (get #groupNumber territory == 0) (territoryDetails territory)}
    |]


territoryDetails :: Territory -> Html
territoryDetails territory = [hsx|
        <a class="list-group-item list-group-item-action" href={ShowTerritoryAction (get #id territory)}>{get #name territory}</a>
    |]

