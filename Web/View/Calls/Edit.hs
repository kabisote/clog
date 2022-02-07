module Web.View.Calls.Edit where
import Web.View.Prelude

data EditView = EditView { call :: Call }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Call</h1>
        {renderForm call}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Calls" CallsAction
                , breadcrumbText "Edit Call"
                ]

renderForm :: Call -> Html
renderForm call = formFor call [hsx|
    {(textField #phoneNumberId)}
    {(textField #agents)}
    {(textField #remarks)}
    {submitButton}

|]