module Web.View.Calls.Show where
import Web.View.Prelude

data ShowView = ShowView { call :: Call }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Call</h1>
        <p>{call}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Calls" CallsAction
                            , breadcrumbText "Show Call"
                            ]