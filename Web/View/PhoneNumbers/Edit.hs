module Web.View.PhoneNumbers.Edit where
import Web.View.Prelude

data EditView = EditView { phoneNumber :: PhoneNumber }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit PhoneNumber</h1>
        {renderForm phoneNumber}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PhoneNumbers" PhoneNumbersAction
                , breadcrumbText "Edit PhoneNumber"
                ]

renderForm :: PhoneNumber -> Html
renderForm phoneNumber = formFor phoneNumber [hsx|
    {(textField #phoneNumber)}
    {(textField #source)}
    {(hiddenField #territoryId)}
    {(checkboxField #doNotCall)}
    <a class="btn btn-secondary mr-2" href={ShowPhoneNumberAction (get #id phoneNumber)}>Cancel</a>
    {submitButton { label = "Save Edits" }}

|]
