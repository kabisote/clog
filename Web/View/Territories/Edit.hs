module Web.View.Territories.Edit where
import Web.View.Prelude

data EditView = EditView { territory :: Territory }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Territory</h1>
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
    {submitButton}

|]