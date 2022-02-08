module Web.View.Calls.Edit where
import Web.View.Prelude

newtype EditView = EditView { call :: Call }

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
        {(dateField #createdAt) { fieldLabel = "Date Called" }}
        {(textField #agents) { fieldLabel = "Publisher(s)" }}
        {(textareaField #remarks)}
        <a class="btn btn-secondary mr-2" href={ShowPhoneNumberAction (get #phoneNumberId call)}>Cancel</a>
        {submitButton { label = "Save" }}

    |]

