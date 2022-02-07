module Web.View.Calls.Index where
import Web.View.Prelude

data IndexView = IndexView { calls :: [Call]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewCallAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Call</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach calls renderCall}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Calls" CallsAction
                ]

renderCall :: Call -> Html
renderCall call = [hsx|
    <tr>
        <td>{call}</td>
        <td><a href={ShowCallAction (get #id call)}>Show</a></td>
        <td><a href={EditCallAction (get #id call)} class="text-muted">Edit</a></td>
        <td><a href={DeleteCallAction (get #id call)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]