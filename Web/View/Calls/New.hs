module Web.View.Calls.New where
import Web.View.Prelude

data NewView = NewView { call :: Call }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Call</h1>
        {renderForm call}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Calls" CallsAction
                , breadcrumbText "New Call"
                ]

renderForm :: Call -> Html
renderForm call = formFor call [hsx|
    {(textField #phoneNumberId)}
    {(textField #agents)}
    {(textField #remarks)}
    {submitButton}

|]
