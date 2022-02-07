module Web.View.Territories.New where
import Web.View.Prelude

data NewView = NewView { territory :: Territory }

instance View NewView where
    html NewView { .. } = [hsx|
        <h1 class="mb-4 pt-4">New Territory</h1>
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
    <a class="btn btn-secondary mr-2" href={TerritoriesAction}>Cancel</a>
    {submitButton {label = "Save"}}

|]
