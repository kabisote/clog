module Web.View.Calls.New where
import Web.View.Prelude

data NewView = NewView { call :: Call, phoneNumber :: PhoneNumber }

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
        {(hiddenField #phoneNumberId)}
        {(dateField #createdAt) { fieldLabel = "Date Called" }}
        {(textField #agents) { fieldLabel = "Publisher(s)" }}
        {(textField #remarks)}
        <a class="btn btn-secondary mr-2" href={ShowPhoneNumberAction (get #phoneNumberId call)}>Cancel</a>
        {submitButton { label = "Save" }}

    |]

