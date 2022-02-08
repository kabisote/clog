module Web.View.PhoneNumbers.Edit where
import Web.View.Prelude

data EditView = EditView { phoneNumber :: PhoneNumber }

instance View EditView where
    html EditView { .. } = [hsx|
        <h1 class="mb-4 pt-4">Edit Phone Number</h1>
        {renderForm phoneNumber}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PhoneNumbers" PhoneNumbersAction
                , breadcrumbText "Edit PhoneNumber"
                ]

renderForm :: PhoneNumber -> Html
renderForm phoneNumber = formFor phoneNumber [hsx|
    {(textField #phoneNumber) { helpText = "Numbers only. No spaces and other characters." }}
    {(textField #source) { helpText = "ex. directory, google maps, facebook" }}
    {(hiddenField #territoryId)}
    {(checkboxField #doNotCall)}
    <a class="btn btn-secondary mr-2" href={ShowPhoneNumberAction (get #id phoneNumber)}>Cancel</a>
    {submitButton { label = "Save" }}

|]
