module Web.View.Territories.New where
import Web.View.Prelude

data NewView = NewView { territory :: Territory }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Territory</h1>
        {renderForm territory}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Territories" TerritoriesAction
                , breadcrumbText "New Territory"
                ]

renderForm :: Territory -> Html
renderForm territory = formFor territory [hsx|
    {(textField #name)}
    {(textField #groupNumber)}
    {submitButton}

|]