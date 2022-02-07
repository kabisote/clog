module Web.View.Territories.Index where
import Web.View.Prelude

newtype IndexView = IndexView { territories :: [Territory]  }

instance View IndexView where
    html IndexView { .. } = [hsx|

        <h1 class="mb-4 pt-4">Territories</h1>
        <p> <a href={pathTo NewTerritoryAction} class="btn btn-primary">Add Territory</a></p>

        <div class="row  row-cols-1 row-cols-md-3 g-4">
            <!-- Common Territory -->
            <div class="col">
                <div class="card my-4">
                    <h5 class="card-header">Common Territory</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 0)}
                    </ul>
                </div>
            </div>

            <div class="col">
                <!-- Group 1 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 1</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 1)}
                    </ul>
                </div>
            </div>
                
            <div class="col">
                <!-- Group 2 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 2</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 2)}
                    </ul>
                </div>
            </div>

            <div class="col">
                <!-- Group 3 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 3</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 3)}
                    </ul>
                </div>
            </div>

            <div class="col">
                <!-- Group 4 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 4</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 4)}
                    </ul>
                </div>
            </div>

            <div class="col">
                <!-- Group 5 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 5</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 5)}
                    </ul>
                </div>
            </div>
                
            <div class="col">
                <!-- Group 6 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 6</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 6)}
                    </ul>
                </div>
            </div>

            <div class="col">
                <!-- Group 7 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 7</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 7)}
                    </ul>
                </div>
            </div>

            <div class="col">
                <!-- Group 8 -->
                <div class="card my-4">
                    <h5 class="card-header">Group 8</h5>
                    <ul class="list-group list-group-flush">
                        {forEach territories (renderTerritory 8)}
                    </ul>
                </div>
            </div>
        </div>

    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Territories" TerritoriesAction
                ]

renderTerritory :: Int -> Territory -> Html
renderTerritory n territory = [hsx|
    {when (n == get #groupNumber territory) territoryDetails}
|]
    where
        territoryDetails = [hsx|
            <li class="list-group-item">
                <a href={ShowTerritoryAction (get #id territory)}>{get #name territory}</a>
                (
                <a href={EditTerritoryAction (get #id territory)} class="text-muted">Edit</a>
                |
                <a href={DeleteTerritoryAction (get #id territory)} class="js-delete text-muted">Delete</a>
                )
            </li>
        |]

