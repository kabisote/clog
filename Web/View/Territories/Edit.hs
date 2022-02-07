module Web.View.Territories.Edit where
import Web.View.Prelude

data EditView = EditView { territory :: Territory }

instance View EditView where
    html EditView { .. } = [hsx|
        <h1 class="mb-4 pt-4">Edit Territory</h1>
        {renderForm territory}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Territories" TerritoriesAction
                , breadcrumbText "Edit Territory"
                ]

renderForm :: Territory -> Html
renderForm territory = formFor territory [hsx|
    {(textField #name)}
    {(textField #groupNumber)}
    <a class="btn btn-secondary mr-2" href={TerritoriesAction}>Cancel</a>
    {submitButton {label = "Save"}}

|]
