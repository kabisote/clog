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
    {(hiddenField #phoneNumberId)}
    {(textField #agents) { fieldLabel = "Publisher(s)" }}
    {(textField #remarks)}
    <a class="btn btn-secondary mr-2" href={ShowPhoneNumberAction (get #phoneNumberId call)}>Cancel</a>
    {submitButton { label = "Save" }}

|]
